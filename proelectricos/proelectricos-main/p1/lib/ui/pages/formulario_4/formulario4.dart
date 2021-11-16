import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form4.dart';
import 'package:p1/domain/pdf/pdf_generation4.dart';
import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte1_form4.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte2_form4.dart';
import 'package:p1/ui/pages/formulario_4/components/partes/parte3_form4.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:p1/ui/pages/sheets/form_4_sheet.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_4.dart';

class FormularioCuatro extends StatefulWidget {
  final int jobNumber; // Representa a que trabajo pertenece este formulario.
  const FormularioCuatro({Key? key, required this.jobNumber}) : super(key: key);
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
                  generateForm4PDF(
                      "jobs/job${widget.jobNumber}/formulario4.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      lider.text,
                      ubicacion.text,
                      contratista.text,
                      nombreapellidos.text,
                      cedula.text,
                      arl.text,
                      eps.text,
                      cargo.text,
                      trabajoRealizado.text,
                      desenergizado,
                      energizado,
                      Get.find<ControllerForm4>());

                  //Data que se envia al sheets
                  var arr4 =
                      List.filled(C.valorswparte4.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte4.length; i++) {
                    if (C.valorswparte4[i].value == true) {
                      arr4[i] = 'Sí';
                    } else {
                      arr4[i] = 'No';
                    }
                  }

                  final dataForm4 = {
                    form4Fields.fecha: pickedDate.toString(),
                    form4Fields.lider: lider.text.toString(),
                    form4Fields.ubicacion: ubicacion.text.toString(),
                    form4Fields.contratista: contratista.text.toString(),
                    form4Fields.nombreapellidos:
                        nombreapellidos.text.toString(),
                    form4Fields.cedula: cedula.text.toString(),
                    form4Fields.arl: arl.text.toString(),
                    form4Fields.eps: eps.text.toString(),
                    form4Fields.cargo: cargo.text.toString(),
                    form4Fields.trabajoRealizado:
                        trabajoRealizado.text.toString(),
                    form4Fields.desenergizado: desenergizado.toString(),
                    form4Fields.energizado: energizado.toString(),
                    form4Fields.vect4_1: arr4[0],
                    form4Fields.vect4_2: arr4[1],
                    form4Fields.vect4_3: arr4[2],
                    form4Fields.vect4_4: arr4[3],
                    form4Fields.vect4_5: arr4[4],
                    form4Fields.vect4_6: arr4[5],
                    form4Fields.vect4_7: arr4[6],
                    form4Fields.vect4_8: arr4[7],
                    form4Fields.vect4_9: arr4[8],
                    form4Fields.vect4_10: arr4[9],
                    form4Fields.vect4_11: arr4[10],
                    form4Fields.vect4_12: arr4[11],
                    form4Fields.vect4_13: arr4[12],
                    form4Fields.vect4_14: arr4[13],
                    form4Fields.vect4_15: arr4[14],
                    form4Fields.vect4_16: arr4[15],
                    form4Fields.vect4_17: arr4[16],
                    form4Fields.vect4_18: arr4[17],
                    form4Fields.vect4_19: arr4[18],
                    form4Fields.vect4_20: arr4[19],
                    form4Fields.vect4_21: arr4[20],
                    form4Fields.vect4_22: arr4[21],
                    form4Fields.vect4_23: arr4[22],
                    form4Fields.vect4_24: arr4[23],
                    form4Fields.vect4_25: arr4[24],
                    form4Fields.vect4_26: arr4[25],
                    form4Fields.vect4_27: arr4[26],
                  };

                  //Llamamos a la función .insertar() para que inserte la info en el sheets
                  await FormSheets4.insertar([dataForm4]);
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
          title: const Text("Firma del supervisor"),
          content: const Align(
            child: MyButton("Firmar", "supervisor_signature",
                Icon(Icons.feed, size: 0, color: Colors.black)),
            alignment: Alignment.center,
          ),
        ),
      ];
}
