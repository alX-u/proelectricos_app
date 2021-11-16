import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:p1/domain/pdf/pdf_upload.dart';
import 'package:p1/ui/pages/formulario_1/formulario_1.dart';
import 'package:p1/ui/pages/formulario_2/formulario_2.dart';
import 'package:p1/ui/pages/formulario_4/formulario4.dart';
import 'package:p1/ui/pages/formulario_5/components/formulario_5.dart';
import 'package:p1/ui/widgetReutilizables/boton_widget.dart';
import 'package:p1/ui/pages/formulario_3/formulario_3.dart';

Color completedGreen = Colors.green;

class OpcionesMenu extends StatelessWidget {
  final int jobNumber; // representa el número del trabajo de este menu
  OpcionesMenu({Key? key, required this.jobNumber}) : super(key: key);

  WorkPageController C = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
      child: Column(
        children: [
          //PARTE DE LOS FORMULARIOS
          //Llamamos a la clase BotonWidget
          BotonWidget(
            text: "Autorización de trabajo",
            icon: const Icon(Icons.feed, size: 20.0, color: proElectricosBlue),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FormularioUno(jobNumber: jobNumber)))
            },
          ),
          BotonWidget(
            text: "Análisis de trabajo seguro",
            icon: const Icon(Icons.lock, size: 20.0, color: proElectricosBlue),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FormularioDos(jobNumber: jobNumber)))
            },
          ),
          BotonWidget(
            text: "Lista de chequeo para trabajo en alturas",
            icon: const Icon(Icons.escalator,
                size: 20.0, color: proElectricosBlue),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FormularioTres(jobNumber: jobNumber)))
            },
          ),
          BotonWidget(
            text: "Lista de chequeo para trabajos eléctricos",
            icon: const Icon(Icons.tungsten,
                size: 20.0, color: proElectricosBlue),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FormularioCuatro(jobNumber: jobNumber)))
            },
          ),
          BotonWidget(
            text: "Preoperacional del vehículo",
            icon: const Icon(Icons.local_shipping,
                size: 20.0, color: proElectricosBlue),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FormularioCinco(jobNumber: jobNumber)))
            },
          ),
          const SizedBox(
            height: 35,
          ),
          //Parte de abajo que te da la opción de guardar o cancelar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () async {
                  try {
                    if (await uploadStoredJobPDFS(jobNumber)
                        .timeout(const Duration(seconds: 30))) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Se enviaron los formularios correctamente.')));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Completar todos los formularios primero!')));
                    }
                  } on TimeoutException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'No se pudo enviar los formularios, verificar la conexión de internet.')));
                  }
                },
                color: proElectricosBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Enviar",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
