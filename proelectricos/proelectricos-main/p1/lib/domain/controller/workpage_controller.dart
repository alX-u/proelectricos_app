import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_trabajo/job_widget.dart';


class WorkPageController extends GetxController {

  final RxList<Widget> _joblist = <Widget>[].obs;

  RxList<Widget> get joblist => _joblist;

  void init() async {
    addAddJobButton();
  }
  //Esta función añade el botón que permite añadir nuevos trabajos
  void addAddJobButton() {
    _joblist.add(IconButton(
      onPressed: () => {addJob()},
      icon: const Icon(Icons.add),
    ));
  }

  //Esta función te permite añadir nuevos trabajos a la lista de trabajo
  void addJob() {
    _joblist.removeLast();
    //Llamamos a JobWidget para añadir un nuevo botón de trabajo
    _joblist.add(JobWidget(jobName: "Trabajo: ${_joblist.length}"));
    //Esto añade el botón debajo de la lista
    addAddJobButton();
  }

}
