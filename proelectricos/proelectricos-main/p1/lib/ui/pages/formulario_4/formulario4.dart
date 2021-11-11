import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form4.dart';
import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte1_form4.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte2_form4.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte3_form4.dart';

class FormularioCuatro extends StatefulWidget {
  const FormularioCuatro({Key? key}) : super(key: key);
  @override
  _FormularioCuatroPage createState() => _FormularioCuatroPage();
}

class _FormularioCuatroPage extends State<FormularioCuatro> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  //Parte1 form4
  DateTime pickedDate = DateTime.now();
  final TextEditingController lider = TextEditingController();
  final TextEditingController ubicacion = TextEditingController();
  final TextEditingController contratista = TextEditingController();
  //Parte2 form 4
  final TextEditingController nombreapellidos = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController arl = TextEditingController();
  final TextEditingController eps = TextEditingController();
  final TextEditingController cargo = TextEditingController();
  //Parte3 form 4
  final TextEditingController trabajoRealizado = TextEditingController();
  final bool desenergizado = true;
  final bool energizado = false;
  //Parte4 form 4
  //Vectores para booleanos
  //Llamar al controlador
  //ControllerForm4 C = Get.find<ControllerForm4>();
  //Son los vectores de booleanos para las tablas
  //C.valorswparte4 tiene valores de la tabla

  @override
  void initState() {
    Get.put(ControllerForm4());
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ControllerForm4 C = Get.find<ControllerForm4>();
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Lista de chequeo para trabajos eléctricos',
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
  List<Step> getSteps(ControllerForm4 C) => [
        Step(
          //Que cuando esté en un paso mayor a este, se ponga un chilito en la bolita
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          //Que si el estado actual es >=0 se ponga en azul el botón
          isActive: currentStep >= 0,
          title: const Text("General"),
          content: Parte1Form4(
              pickedDate: pickedDate,
              lider: lider,
              contratista: contratista,
              ubicacion: ubicacion),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Equipo de trabajo"),
          content: Parte2Form4(
            nombreapellidos: nombreapellidos,
            cedula: cedula,
            arl: arl,
            eps: eps,
            cargo: cargo,
          ),
        ),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Tipo de trabajo a realizar"),
            content: Parte3Form4(
                trabajoRealizado: trabajoRealizado,
                desenergizado: desenergizado,
                energizado: energizado)),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title:
              const Text("Verificaciones previas a la ejecución del trabajo"),
          content: TablasForm(
              titleColumns: const ['Concepto a analizar', 'No/Sí'],
              titleRows: CamposFormularios.camposParte4Form4,
              valorsw: C.valorswparte4),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text("Firmas"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
      ];
}
