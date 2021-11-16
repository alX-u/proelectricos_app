import 'package:get/get.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

Future<String> get jobPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path + '/jobs/';
}

Future<void> uploadFile(String filePath, String uploadPath) async {
  File file = File(filePath);

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref(uploadPath)
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print("Failed to upload file!");
  }
}

Future<void> generateDummyPDF(String filename) async {
  // Genera PDF Vacio dummy, solo para hacer pruebas
  // La estructura del filename y del nombre del archivo SI es la que debería seguir:
  // job${job_number}/formulario1.pdf
  // Ejemplo: job1/formulario1.pdf <-- Note no lleva el primer /

  final PdfDocument document = PdfDocument();
  String jobpaths = await jobPath;
  await File(jobpaths + filename).writeAsBytes(document.save());
}

Future<bool> uploadStoredJobPDFS(int jobNumber) async {
  // generate all 5 pdfs for testing.
  //await generateDummyPDF("job$jobNumber/formulario1.pdf");
  //await generateDummyPDF("job$jobNumber/formulario2.pdf");
  //await generateDummyPDF("job$jobNumber/formulario3.pdf");
  //await generateDummyPDF("job$jobNumber/formulario4.pdf");
  //await generateDummyPDF("job$jobNumber/formulario5.pdf");
  //print("generated dummies!");
  // Check that all 5 pdf's exists.

  String jobpath = await jobPath;
  String pdf1path = jobpath + "job$jobNumber/formulario1.pdf";
  String pdf2path = jobpath + "job$jobNumber/formulario2.pdf";
  String pdf3path = jobpath + "job$jobNumber/formulario3.pdf";
  String pdf4path = jobpath + "job$jobNumber/formulario4.pdf";
  String pdf5path = jobpath + "job$jobNumber/formulario5.pdf";
  if (await File(pdf1path).exists() &&
      await File(pdf2path).exists() &&
      await File(pdf3path).exists() &&
      await File(pdf4path).exists() &&
      await File(pdf5path).exists()) {
    AuthenticationController auth = Get.find();
    WorkPageController C = Get.find();
    String cc = auth.cc;
    int thisDaysJob = C.jobsthisday.value + 1;
    DateTime today = DateTime.now();

    String todaysdate = "${today.day}-${today.month}-${today.year}";

    print("Today's Date:" + todaysdate);
    print("This day's job ID: $thisDaysJob");
    await uploadFile(
        pdf1path, "formularios/form1/$todaysdate/$cc/$thisDaysJob.pdf");
    await uploadFile(
        pdf2path, "formularios/form2/$todaysdate/$cc/$thisDaysJob.pdf");
    await uploadFile(
        pdf3path, "formularios/form3/$todaysdate/$cc/$thisDaysJob.pdf");
    await uploadFile(
        pdf4path, "formularios/form4/$todaysdate/$cc/$thisDaysJob.pdf");
    await uploadFile(
        pdf5path, "formularios/form5/$todaysdate/$cc/$thisDaysJob.pdf");
    print("Successfully uploaded all PDFS!");
    // Delete all files once uploaded.

    C.deleteJob(jobNumber);
    C.increaseTodayJobsCounter();
    print("Successfully cleaned all uploaded PDFS!");
    return true;
  } else {
    print("Generate all PDFS first!");
    return false;
  }
}
