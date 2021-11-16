import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form5.dart';
import 'package:p1/domain/pdf/pdf_generation5.dart';
import 'package:p1/ui/pages/formulario_5/components/partes/parte1_form5.dart';
import 'package:p1/ui/pages/formulario_5/components/partes/parte7_form5.dart';
import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:p1/ui/pages/sheets/form_5_sheet.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_5.dart';

class FormularioCinco extends StatefulWidget {
  final int jobNumber; // Representa a que trabajo pertenece este formulario.
  const FormularioCinco({Key? key, required this.jobNumber}) : super(key: key);
  @override
  _FormularioCincoPage createState() => _FormularioCincoPage();
}

enum SingingCharacter { grua, canasta }
enum SingingCharacter1 { si, no }
enum SingingCharacter2 { yes, not }

class _FormularioCincoPage extends State<FormularioCinco> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  //Parte1 form5
  DateTime pickedDate = DateTime.now();
  SingingCharacter? character = SingingCharacter.grua;
  SingingCharacter1? character1 = SingingCharacter1.si;
  SingingCharacter2? character2 = SingingCharacter2.yes;
  final TextEditingController placa = TextEditingController();
  final TextEditingController certDiel = TextEditingController();
  final TextEditingController certIz = TextEditingController();
  //Vectores para booleanos
  //Llamar al controlador
  //ControllerForm5 C = Get.find<ControllerForm5>();
  //Son los vectores de booleanos para las tablas
  //C.valorswparte2 tiene valores de la tabla de la parte 2
  //C.valorswparte3 tiene valores de la tabla de la parte 3
  //C.valorswparte4 tiene valores de la tabla de la parte 4
  //C.valorswparte5 tiene valores de la tabla de la parte 5
  //C.valorswparte6 tiene valores de la tabla de la parte 6
  //Parte7 form5
  final TextEditingController kilometraje = TextEditingController();
  final TextEditingController horometro = TextEditingController();

  @override
  void initState() {
    Get.put(ControllerForm5());
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ControllerForm5 C = Get.find<ControllerForm5>();
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Inspección preoperacional de carro canasta y/o grua',
        backgroundColor: proElectricosBlue,
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Form(
        key: _formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: proElectricosBlue),
          ),
          child: Stepper(
            type: StepperType.vertical,
            //getSteps() contiene la interfaz como tal
            steps: getSteps(C),
            //Lo que sigue aquí abajo son los métodos del getsteps
            //Variable que guarda el estado actual
            currentStep: currentStep,
            //Si oprimimos continue se aumenta en 1 el estado actual
            onStepContinue: () async {
              final isLastStep = currentStep == getSteps(C).length - 1;
              if (!isLastStep) {
                //Y hace las cosas del form
                // Validate returns true if the form is valid, or false otherwise.
                //if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                setState(() => currentStep += 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Prosiga')),
                );
                //}

              } else {
                if (_formKey.currentState!.validate()) {
                  print("Completed");
                  //EN ESTA PARTE VA LO QUÉ PASA CUANDO TERMINA EL FORMULARIO
                  generateForm5PDF(
                      "jobs/job${widget.jobNumber}/formulario5.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      placa.text,
                      SingingCharacter.grua == character,
                      SingingCharacter1.si == character1,
                      SingingCharacter2.yes == character2,
                      certDiel.text,
                      certIz.text,
                      kilometraje.text,
                      horometro.text,
                      Get.find<ControllerForm5>());

                  var arr2 =
                      List.filled(C.valorswparte2.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte2.length; i++) {
                    if (C.valorswparte2[i].value == true) {
                      arr2[i] = 'Sí';
                    } else {
                      arr2[i] = 'No';
                    }
                  }

                  var arr3 =
                      List.filled(C.valorswparte3.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte3.length; i++) {
                    if (C.valorswparte3[i].value == true) {
                      arr3[i] = 'Sí';
                    } else {
                      arr3[i] = 'No';
                    }
                  }

                  var arr4 =
                      List.filled(C.valorswparte4.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte4.length; i++) {
                    if (C.valorswparte4[i].value == true) {
                      arr4[i] = 'Sí';
                    } else {
                      arr4[i] = 'No';
                    }
                  }

                  var arr5 =
                      List.filled(C.valorswparte5.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte5.length; i++) {
                    if (C.valorswparte5[i].value == true) {
                      arr5[i] = 'Sí';
                    } else {
                      arr5[i] = 'No';
                    }
                  }

                  var arr6 =
                      List.filled(C.valorswparte6.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte6.length; i++) {
                    if (C.valorswparte6[i].value == true) {
                      arr6[i] = 'Sí';
                    } else {
                      arr6[i] = 'No';
                    }
                  }

                  String veh;
                  if (character == SingingCharacter.grua) {
                    veh = "Grua";
                  } else {
                    veh = "Canasta";
                  }
                  String tMeca;
                  if (character1 == SingingCharacter1.si) {
                    tMeca = "Sí";
                  } else {
                    tMeca = "No";
                  }
                  String soat;
                  if (character2 == SingingCharacter2.yes) {
                    soat = "Sí";
                  } else {
                    soat = "No";
                  }

                  final dataForm5 = {
                    form5Fields.fecha: pickedDate.toString(),
                    form5Fields.character: veh,
                    form5Fields.character1: tMeca,
                    form5Fields.character2: soat,
                    form5Fields.placa: placa.text.toString(),
                    form5Fields.certDiel: certDiel.text.toString(),
                    form5Fields.certIz: certIz.text.toString(),
                    form5Fields.vec2_1: arr2[0],
                    form5Fields.vec2_2: arr2[1],
                    form5Fields.vec2_3: arr2[2],
                    form5Fields.vec2_4: arr2[3],
                    form5Fields.vec2_5: arr2[4],
                    form5Fields.vec2_6: arr2[5],
                    form5Fields.vec2_7: arr2[6],
                    form5Fields.vec2_8: arr2[7],
                    form5Fields.vec2_9: arr2[8],
                    form5Fields.vec3_1: arr3[0],
                    form5Fields.vec3_2: arr3[1],
                    form5Fields.vec3_3: arr3[2],
                    form5Fields.vec3_4: arr3[3],
                    form5Fields.vec3_5: arr3[4],
                    form5Fields.vec3_6: arr3[5],
                    form5Fields.vec3_7: arr3[6],
                    form5Fields.vec3_8: arr3[7],
                    form5Fields.vec3_9: arr3[8],
                    form5Fields.vec3_10: arr3[9],
                    form5Fields.vec3_11: arr3[10],
                    form5Fields.vec3_12: arr3[11],
                    form5Fields.vec3_13: arr3[12],
                    form5Fields.vec3_14: arr3[13],
                    form5Fields.vec3_15: arr3[14],
                    form5Fields.vec3_16: arr3[15],
                    form5Fields.vec4_1: arr4[0],
                    form5Fields.vec4_2: arr4[1],
                    form5Fields.vec4_3: arr4[2],
                    form5Fields.vec4_4: arr4[3],
                    form5Fields.vec4_5: arr4[4],
                    form5Fields.vec4_6: arr4[5],
                    form5Fields.vec4_7: arr4[6],
                    form5Fields.vec4_8: arr4[7],
                    form5Fields.vec4_9: arr4[8],
                    form5Fields.vec4_10: arr4[9],
                    form5Fields.vec4_11: arr4[10],
                    form5Fields.vec4_12: arr4[11],
                    form5Fields.vec4_13: arr4[12],
                    form5Fields.vec5_1: arr5[0],
                    form5Fields.vec5_2: arr5[1],
                    form5Fields.vec5_3: arr5[2],
                    form5Fields.vec5_4: arr5[3],
                    form5Fields.vec5_5: arr5[4],
                    form5Fields.vec5_6: arr5[5],
                    form5Fields.vec5_7: arr5[6],
                    form5Fields.vec5_8: arr5[7],
                    form5Fields.vec5_9: arr5[8],
                    form5Fields.vec5_10: arr5[9],
                    form5Fields.vec5_11: arr5[10],
                    form5Fields.vec5_12: arr5[11],
                    form5Fields.vec5_13: arr5[12],
                    form5Fields.vec5_14: arr5[13],
                    form5Fields.vec5_15: arr5[14],
                    form5Fields.vec5_16: arr5[15],
                    form5Fields.vec6_1: arr6[0],
                    form5Fields.vec6_2: arr6[1],
                    form5Fields.vec6_3: arr6[2],
                    form5Fields.vec6_4: arr6[3],
                    form5Fields.vec6_5: arr6[4],
                    form5Fields.vec6_6: arr6[5],
                    form5Fields.vec6_7: arr6[6],
                    form5Fields.kilometraje: kilometraje.text.toString(),
                    form5Fields.horometro: horometro.text.toString()
                  };

                  //Llamamos a la función .insertar() para que inserte la info en el sheets
                  await FormSheets5.insertar([dataForm5]);
                  //Enviamos un mensaje que le indique al ususario que el formulario
                  //ha sido llenado exitosamente
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('¡Formulario llenado con éxito!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Rellene todos los campos')),
                  );
                }
              }
            },
            onStepCancel: () {
              currentStep == 0 ? null : setState(() => currentStep -= 1);
            },
            //Cuando oprime el indice de un Step
            onStepTapped: (step) => setState(() => currentStep = step),
            //Diseño para los botones
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              final isLastStep = currentStep == getSteps(C).length - 1;
              return Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentStep != 0)
                    OutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: onStepCancel,
                      child: const Text("Anterior",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),
                  RaisedButton(
                    onPressed: onStepContinue,
                    color: proElectricosBlue,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    child: Text(
                      isLastStep ? "Guardar" : "Siguiente",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                ],
              ));
            },
          ),
        ),
      ),
    );
  }

  //Aquí están los formularios divididos en sus respectivas partes
  List<Step> getSteps(ControllerForm5 C) => [
        Step(
            //Que cuando esté en un paso mayor a este, se ponga un chilito en la bolita
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            //Que si el estado actual es >=0 se ponga en azul el botón
            isActive: currentStep >= 0,
            title: const Text("General"),
            content: Parte1Form5(
                pickedDate: pickedDate,
                placa: placa,
                certDiel: certDiel,
                certIz: certIz,
                character: character,
                character1: character1,
                character2: character2)),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Llantas/Orden y aseo"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Condiciones a inspeccionar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte2Form5,
                valorsw: C.valorswparte2),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
              "Fluidos(Niveles y fugas)/Equipo de carretería y seguridad"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Condiciones a inspeccionar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte3Form5,
                valorsw: C.valorswparte3),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Sistema hidraúlico/ Sistema de Izaje"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Condiciones a inspeccionar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte4Form5,
                valorsw: C.valorswparte4),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text(
              "Sistema de frenos/ Sistema eléctrico (Luces y controles)"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Condiciones a inspeccionar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte5Form5,
                valorsw: C.valorswparte5),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 5 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 5,
          title: const Text("Sistema mecánico/ Otros"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Condiciones a inspeccionar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte6Form5,
                valorsw: C.valorswparte6),
            alignment: Alignment.center,
          ),
        ),
        Step(
            state: currentStep > 6 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 6,
            title: const Text("Kilometraje y horometro"),
            content:
                Parte7Form5(kilometraje: kilometraje, horometro: horometro)),
        Step(
          state: currentStep > 7 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 7,
          title: const Text("Firma del supervisor"),
          content: const Align(
            child: MyButton("Firmar", "supervisor_signature",
                Icon(Icons.feed, size: 0, color: Colors.black)),
            alignment: Alignment.center,
          ),
        ),
      ];
}
