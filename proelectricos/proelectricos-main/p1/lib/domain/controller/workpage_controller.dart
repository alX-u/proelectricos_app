import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p1/domain/pdf/pdf_upload.dart';
import 'package:p1/ui/widgets/menu_trabajo/job_widget.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:p1/data/local_preferences.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<String> get _jobpath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path + '/jobs/';
}

class WorkPageController extends GetxController {
  LocalPreferences lp = LocalPreferences();
  // Contiene un "LastAccessed", una unix-timestamp
  // Contiene un "JobsThisDay"
  // para reiniciar el contador detrabajos subidos un día./
  // "jobsthisday" y así evitar problemas con la base de firebase sobreescribiendo trabajos.

  final RxList<Widget> _joblist = <Widget>[].obs;

  RxList<Widget> get joblist => _joblist;

  RxInt jobsthisday = 0.obs;

  final List<int> _jobnumbers = [];

  Future<bool> isFormCompleted(int formNumber, int jobNumber) async {
    return await File(await jobPath + "job$jobNumber/formulario$formNumber.pdf")
        .exists();
  }
  // Trabajos Actualmente almacenados
  // Puede ser trabajo 1 y 3. (Creo 3 trabajos. Y envío el trabajo 2)
  // Al crear un trabajo se debe crear el max + 1 para así no haber confusiones.
  // Al completar un trabajo y eliminarlo, se elimina su carpeta totalmente.

  Future<void> _verifyJobDirectory() async {
    // verifies that job directory exists.
    var jobsDirectory = Directory(await _jobpath);
    if (!await jobsDirectory.exists()) {
      // create it
      await jobsDirectory.create();
    }
  }

  Future<void> initController() async {
    await _verifyJobDirectory();
    // createNewJobDirectory(1);
    await _getExistingJobsDirectory();
    addAddJobButton();

    // Check Jobs This day.
    await _checkJobsThisDayReset();
  }

  Future<void> _checkJobsThisDayReset() async {
    int last = await lp.retrieveData<int>("LastAccessed") ?? -1;
    int current = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    // update jobs this day value
    jobsthisday.value = await lp.retrieveData<int>("JobsThisDay") ?? 0;
    if (last != -1) {
      // compare access timestamps. If it's a different day reset counter.
      if (DateTime.fromMillisecondsSinceEpoch(last * 1000).day !=
          DateTime.fromMillisecondsSinceEpoch(current * 1000).day) {
        jobsthisday.value = 0; // reset value
        await lp.storeData<int>("JobsThisDay", 0);
      }
    }
    await lp.storeData<int>("LastAccessed", current); // update new timestamp.
    return;
  }

  Future<void> increaseTodayJobsCounter() async {
    // increases the successful times a job has been done by 1.
    int prevcounter = await lp.retrieveData<int>("JobsThisDay") ?? 0;
    prevcounter++;
    jobsthisday.value = prevcounter;
    await lp.storeData<int>("JobsThisDay", prevcounter);
  }

  //Esta función añade el botón que permite añadir nuevos trabajos
  void addAddJobButton() {
    if (_joblist.isNotEmpty) {
      if (_joblist.last is IconButton) {
        return;
      }
    }
    _joblist.add(IconButton(
      onPressed: () => {addJob()},
      icon: const Icon(Icons.add),
    ));
  }

  //Esta función te permite añadir nuevos trabajos a la lista de trabajo
  void addJob() async {
    int toadd = _jobnumbers.isEmpty ? 1 : (_jobnumbers.reduce(max) + 1);
    _jobnumbers.add(toadd);
    await _addJobToList(toadd);
    await _createNewJobDirectory(toadd);
  }

  Future<void> _addJobToList(int jobNumber) async {
    if (_joblist.isNotEmpty) {
      if (_joblist.last is IconButton) {
        _joblist.removeLast();
      }
    }
    //Llamamos a JobWidget para añadir un nuevo botón de trabajo
    _joblist.add(JobWidget(
      jobName: "Trabajo: $jobNumber",
      jobNumber: jobNumber,
    ));
    //Esto añade el botón debajo de la lista
    addAddJobButton();
  }

  Future<void> updateJoblist() async {
    // updates joblist, reading from stored jobs.
    _joblist.clear();
    _jobnumbers.clear();
    await _getExistingJobsDirectory();
    addAddJobButton();
  }

  /* Folder structure is 
  jobs/|
       |-- job1/
              |
              |- formulario1.pdf
              |- formulario2.pdf
              .
              .
              .
       |---job2/
       |---job3/
       .
       .
       .
       */
  Future<void> _createNewJobDirectory(int jobNumber) async {
    await Directory(await _jobpath + 'job$jobNumber').create(recursive: true);
  }

  Future<void> _getExistingJobsDirectory() async {
    // Reads and updates existing jobs for any previously stored jobs.
    // ONLY CALLED ON APPLICATION STARTUP
    var jobsDirectory = Directory(await _jobpath);
    await for (var entity
        in jobsDirectory.list(recursive: false, followLinks: false)) {
      int bindex = entity.path.lastIndexOf('b');
      int jobNumber = int.parse(entity.path.substring(bindex + 1));
      // print("Stored Job: " + entity.path + " jobNumber -> $jobNumber");
      _jobnumbers.add(jobNumber);
      await _addJobToList(jobNumber); // add a job for each directory.
    }
  }

  Future<void> deleteJob(int jobNumber) async {
    // Deletes the job, with it's associated folder. Should be called once job is uploaded.
    Directory(await _jobpath + "job$jobNumber/")
        .delete(recursive: true); // delete whole directory
    updateJoblist(); // update joblist again.
  }
}
