import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form2.dart';
import 'package:p1/domain/pdf/pdf_generation.dart';
import 'package:p1/ui/pages/formulario_2/components/partes/parte1_form2.dart';
import 'package:p1/ui/pages/formulario_2/components/partes/parte2_form2.dart';
import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';

class FormularioDos extends StatefulWidget {
  const FormularioDos({Key? key}) : super(key: key);
  @override
  _FormularioDosPage createState() => _FormularioDosPage();
}

enum SingingCharacter { rutinario, noRutinario }
enum SingingCharacter1 { tAltura, tElectrico }

class _FormularioDosPage extends State<FormularioDos> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  //Parte1 form2
  DateTime pickedDate = DateTime.now();
  final TextEditingController nombre = TextEditingController();
  final TextEditingController trabajo = TextEditingController();
  SingingCharacter? character = SingingCharacter.rutinario;
  SingingCharacter1? character1 = SingingCharacter1.tElectrico;
  //Parte2 form2
  final TextEditingController nombreapellidos = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController arl = TextEditingController();
  final TextEditingController eps = TextEditingController();
  final TextEditingController cargo = TextEditingController();
  //De la parte 3 a la parte 13
  //Vectores para booleanos
  //Llamar al controlador
  //ControllerForm2 C = Get.find<ControllerForm2>();
  //Son los vectores de booleanos para las tablas
  //C.valorswparte3 tiene valores de la tabla 3
  //C.valorswparte4
  //C.valorswparte5
  //C.valorswparte6
  //C.valorswparte7
  //C.valorswparte8
  //C.valorswparte9
  //C.valorswparte10
  //C.valorswparte11
  //C.valorswparte12
  //C.valorswparte13

  @override
  void initState() {
    Get.put(ControllerForm2());
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ControllerForm2 C = Get.find<ControllerForm2>();
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Formato de análisis de trabajo seguro',
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
                  //EN ESTA PARTE VA LO QUÉ PASA CUANDO TERMINA EL FORMULARIO
                  generateForm2PDF(
                      "formulario2.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      nombre.text,
                      SingingCharacter.rutinario == character,
                      SingingCharacter.noRutinario == character,
                      SingingCharacter1.tAltura == character1,
                      SingingCharacter1.tElectrico == character1,
                      trabajo.text,
                      nombreapellidos.text,
                      cargo.text,
                      cedula.text,
                      arl.text,
                      eps.text,
                      Get.find<ControllerForm2>());
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
  List<Step> getSteps(ControllerForm2 C) => [
        Step(
            //Que cuando esté en un paso mayor a este, se ponga un chilito en la bolita
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            //Que si el estado actual es >=0 se ponga en azul el botón
            isActive: currentStep >= 0,
            title: const Text("General"),
            content: Parte1Form2(
                pickedDate: pickedDate,
                nombre: nombre,
                trabajo: trabajo,
                character: character,
                character1: character1)),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text("Equipo de trabajo"),
            content: Parte2Form2(
                nombreapellidos: nombreapellidos,
                cedula: cedula,
                arl: arl,
                eps: eps,
                cargo: cargo)),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
              "RIESGO ELÉCTRICO- Supervisión de trabajos eléctricos"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte3Form2,
                valorsw: C.valorswparte3),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text(
              "R. MECANISMOS- Mecanismos en movimientos L cortantes, Proy. de partículas, Sup. ásperas"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte4Form2,
                valorsw: C.valorswparte4),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text("R. TRABAJO EN ALTURAS"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte5Form2,
                valorsw: C.valorswparte5),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 5 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 5,
          title: const Text("R. BIOMECÁNICOS"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte6Form2,
                valorsw: C.valorswparte6),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 6 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 6,
          title: const Text(
              "R. FÍSICO- Temperaturas extremas, iluminación, ruido, radiaciones"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte7Form2,
                valorsw: C.valorswparte7),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 7 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 7,
          title: const Text("R. PÚBLICO"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte8Form2,
                valorsw: C.valorswparte8),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 8 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 8,
          title: const Text("R. TRÁNSITO"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte9Form2,
                valorsw: C.valorswparte9),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 9 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 9,
          title: const Text(
              "R. BIOLÓGICO- Virus, hongos, bacterias, animales, COVID-19"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte10Form2,
                valorsw: C.valorswparte10),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 10 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 10,
          title: const Text("R. PSICOSOCIAL"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte11Form2,
                valorsw: C.valorswparte11),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 11 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 11,
          title: const Text(
              "R. LOCATIVOS- Defectos del piso(lisos, irregulares, húmedos o fangosos)"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte12Form2,
                valorsw: C.valorswparte12),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 12 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 12,
          title: const Text("R. QUÍMICO- Gases, vapores, partículas, líquidos"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Medida de control', 'No/Sí'],
                titleRows: CamposFormularios.camposParte13Form2,
                valorsw: C.valorswparte13),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 13 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 13,
          title: const Text("Firmas"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
      ];
}
