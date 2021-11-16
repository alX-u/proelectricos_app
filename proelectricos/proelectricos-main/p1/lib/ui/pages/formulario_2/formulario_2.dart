import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form2.dart';
import 'package:p1/domain/pdf/pdf_generation2.dart';
import 'package:p1/ui/pages/formulario_2/components/partes/parte1_form2.dart';
import 'package:p1/ui/pages/formulario_2/components/partes/parte2_form2.dart';
import 'package:p1/ui/pages/sheets/form_2_sheet.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_2.dart';
import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';

class FormularioDos extends StatefulWidget {
  final int jobNumber; // Representa a que trabajo pertenece este formulario.
  const FormularioDos({Key? key, required this.jobNumber}) : super(key: key);
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
                      "jobs/job${widget.jobNumber}/formulario2.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      nombre.text,
                      trabajo.text,
                      SingingCharacter.rutinario == character,
                      SingingCharacter.noRutinario == character,
                      SingingCharacter1.tAltura == character1,
                      SingingCharacter1.tElectrico == character1,
                      nombreapellidos.text,
                      cedula.text,
                      arl.text,
                      eps.text,
                      cargo.text,
                      Get.find<ControllerForm2>());
                  //Excel
                  var arr3 =
                      List.filled(C.valorswparte3.length, '', growable: false);
                  var arr4 =
                      List.filled(C.valorswparte4.length, '', growable: false);
                  var arr5 =
                      List.filled(C.valorswparte5.length, '', growable: false);
                  var arr6 =
                      List.filled(C.valorswparte6.length, '', growable: false);
                  var arr7 =
                      List.filled(C.valorswparte7.length, '', growable: false);
                  var arr8 =
                      List.filled(C.valorswparte8.length, '', growable: false);
                  var arr9 =
                      List.filled(C.valorswparte9.length, '', growable: false);
                  var arr10 =
                      List.filled(C.valorswparte10.length, '', growable: false);
                  var arr11 =
                      List.filled(C.valorswparte11.length, '', growable: false);
                  var arr12 =
                      List.filled(C.valorswparte12.length, '', growable: false);
                  var arr13 =
                      List.filled(C.valorswparte13.length, '', growable: false);

                  createArray(C.valorswparte3, arr3);
                  createArray(C.valorswparte4, arr4);
                  createArray(C.valorswparte5, arr5);
                  createArray(C.valorswparte6, arr6);
                  createArray(C.valorswparte7, arr7);
                  createArray(C.valorswparte8, arr8);
                  createArray(C.valorswparte9, arr9);
                  createArray(C.valorswparte10, arr10);
                  createArray(C.valorswparte11, arr11);
                  createArray(C.valorswparte12, arr12);
                  createArray(C.valorswparte13, arr13);

                  String rut;
                  if (character == SingingCharacter.rutinario) {
                    rut = "Rutinario";
                  } else {
                    rut = "No Rutinario";
                  }
                  String elect;
                  if (character1 == SingingCharacter1.tElectrico) {
                    elect = "Trabajo eléctrico";
                  } else {
                    elect = "Trabajo en alturas";
                  }

                  final dataForm2 = {
                    Form2Fields.fecha: pickedDate.toString(),
                    Form2Fields.nombre: nombre.text.trim(),
                    Form2Fields.trabajo: trabajo.text.trim(),
                    Form2Fields.tRutinario: rut,
                    Form2Fields.tElectrico: elect,
                    Form2Fields.nombreapellidos: nombreapellidos.text.trim(),
                    Form2Fields.cedula: cedula.text.trim(),
                    Form2Fields.arl: arl.text.trim(),
                    Form2Fields.eps: eps.text.trim(),
                    Form2Fields.cargo: cargo.text.trim(),
                    Form2Fields.vec3_1: arr3[0],
                    Form2Fields.vec3_2: arr3[1],
                    Form2Fields.vec3_3: arr3[2],
                    Form2Fields.vec3_4: arr3[3],
                    Form2Fields.vec4_1: arr4[0],
                    Form2Fields.vec4_2: arr4[1],
                    Form2Fields.vec4_3: arr4[2],
                    Form2Fields.vec4_4: arr4[3],
                    Form2Fields.vec4_5: arr4[4],
                    Form2Fields.vec4_6: arr4[5],
                    Form2Fields.vec4_7: arr4[6],
                    Form2Fields.vec5_1: arr5[0],
                    Form2Fields.vec5_2: arr5[1],
                    Form2Fields.vec5_3: arr5[2],
                    Form2Fields.vec5_4: arr5[3],
                    Form2Fields.vec5_5: arr5[4],
                    Form2Fields.vec5_6: arr5[5],
                    Form2Fields.vec5_7: arr5[6],
                    Form2Fields.vec5_8: arr5[7],
                    Form2Fields.vec6_1: arr6[0],
                    Form2Fields.vec6_2: arr6[1],
                    Form2Fields.vec6_3: arr6[2],
                    Form2Fields.vec7_1: arr7[0],
                    Form2Fields.vec7_2: arr7[1],
                    Form2Fields.vec7_3: arr7[2],
                    Form2Fields.vec7_4: arr7[3],
                    Form2Fields.vec7_5: arr7[4],
                    Form2Fields.vec7_6: arr7[5],
                    Form2Fields.vec7_7: arr7[6],
                    Form2Fields.vec8_1: arr8[0],
                    Form2Fields.vec8_2: arr8[1],
                    Form2Fields.vec9_1: arr9[0],
                    Form2Fields.vec9_2: arr9[1],
                    Form2Fields.vec10_1: arr10[0],
                    Form2Fields.vec10_2: arr10[1],
                    Form2Fields.vec10_3: arr10[2],
                    Form2Fields.vec10_4: arr10[3],
                    Form2Fields.vec10_5: arr10[4],
                    Form2Fields.vec11_1: arr11[0],
                    Form2Fields.vec11_2: arr11[1],
                    Form2Fields.vec12_1: arr12[0],
                    Form2Fields.vec12_2: arr12[1],
                    Form2Fields.vec12_3: arr12[2],
                    Form2Fields.vec12_4: arr12[3],
                    Form2Fields.vec12_5: arr12[4],
                    Form2Fields.vec13_1: arr13[0],
                    Form2Fields.vec13_2: arr13[1],
                    Form2Fields.vec13_3: arr13[2]
                  };
                  //Llamamos a la función .insertar() para que inserte la info en el sheets
                  await FormSheets2.insertar([dataForm2]);
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
          title: const Text("Firma del supervisor"),
          content: const Align(
            child: MyButton("Firmar", "supervisor_signature",
                Icon(Icons.feed, size: 0, color: Colors.black)),
            alignment: Alignment.center,
          ),
        ),
      ];
}

createArray(RxList<RxBool> valorsw, List<String> arr) {
  for (var i = 0; i < valorsw.length; i++) {
    if (valorsw[i].value == true) {
      arr[i] = 'Sí';
    } else {
      arr[i] = 'No';
    }
  }
}
