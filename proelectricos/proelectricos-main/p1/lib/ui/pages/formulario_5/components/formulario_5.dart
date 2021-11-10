import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form5.dart';
import 'package:p1/ui/pages/formulario_5/components/partes/parte1_form5.dart';
import 'package:p1/ui/pages/formulario_5/components/partes/parte7_form5.dart';
import 'package:p1/ui/pages/widgetsReutilizables/CamposDePartes/campos_formularios.dart';
import 'package:p1/ui/pages/widgetsReutilizables/app_bar.dart';
import 'package:p1/ui/pages/widgetsReutilizables/tablas_form.dart';

class FormularioCinco extends StatefulWidget {
  const FormularioCinco({Key? key}) : super(key: key);
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
  //C.valorswparte2 tiene valores de la tabla 2
  //C.valorswparte3 tiene valores de la tabla 3
  //C.valorswparte4 tiene valores de la tabla 4
  //C.valorswparte5 tiene valores de la tabla 5
  //C.valorswparte6 tiene valores de la tabla 6
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
        backgroundColor: Color(0xff264F95),
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Form(
        key: _formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xff264F95)),
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
                    color: const Color(0xff264F95),
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
          title: const Text("Firmas"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
      ];
}
