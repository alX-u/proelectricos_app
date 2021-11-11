/*import 'package:flutter/material.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_form2.dart';
import 'package:p1/domain/pdf/pdf_generation.dart';
import 'package:p1/ui/widgets/formularios/tabla_peligro_form2.dart';
import 'package:p1/domain/controller/controller_tabla_form2.dart';
import 'package:get/get.dart';

class FormularioDosv extends StatefulWidget {
  const FormularioDosv({Key? key}) : super(key: key);
  //DataTimePickerPage() : super();
  @override
  FormularioDosvPage createState() => FormularioDosvPage();
}

enum SingingCharacter { rutinario, norutinario }
enum SingingCharacter1 { alturas, electrico }

class FormularioDosvPage extends State<FormularioDosv> {
  DateTime pickedDate = DateTime.now();
  SingingCharacter? _character = SingingCharacter.rutinario;
  SingingCharacter1? _character1 = SingingCharacter1.alturas;
  // ControllerTablaForm1 tablaController = Get.find()
  final _claveFormulario = GlobalKey<FormState>();
  final _claveFormulario2 = GlobalKey<FormState>();
  final TextEditingController _codigoBarras = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  final TextEditingController _nombre_tecnico = TextEditingController();
  final TextEditingController _nombre_apellido = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _ARL = TextEditingController();
  final TextEditingController _EPS = TextEditingController();

  @override
  void initState() {
    Get.put(ControllerTablaForm1());
    pickedDate = DateTime.now();

    super.initState();
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autorización y ejecución de trabajos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                  "Fecha: ${pickedDate.day}, ${pickedDate.month}, ${pickedDate.year}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Clasificación del trabajo',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Rutinario'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.rutinario,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No rutinario'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.norutinario,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                'La actividad incluye:',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Trabajo en alturas'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.alturas,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Trabajo electrico'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.electrico,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            Form(
              key: _claveFormulario,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe nombre del diligenciador';
                      }
                      return null;
                    },
                    controller: _nombre_tecnico,
                    decoration: const InputDecoration(
                      hintText: 'Escribe nombre de quien diligencia',
                      labelText: "Nombre de quien diligencia",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Align(
                  child: TablaPeligroForm1(),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe trabajo realizado';
                      }
                      return null;
                    },
                    controller: _descripcion,
                    decoration: InputDecoration(
                      hintText: 'Escribe trabajo realizado',
                      labelText: "Trabajo realizado",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Nombre y Apellido';
                      }
                      return null;
                    },
                    controller: _nombre_apellido,
                    decoration: InputDecoration(
                      hintText: 'Escribe Nombre y Apellido',
                      labelText: "Nombre y Apellido",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Cargo a Desempeñar';
                      }
                      return null;
                    },
                    controller: _cargo,
                    decoration: InputDecoration(
                      hintText: 'Escribe Cargo a Desempeñar',
                      labelText: "Cargo a Desempeñar",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Número de Cedula';
                      }
                      return null;
                    },
                    controller: _cedula,
                    decoration: InputDecoration(
                      hintText: 'Escribe Número de Cedula',
                      labelText: "Número de Cedula",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe ARL';
                      }
                      return null;
                    },
                    controller: _ARL,
                    decoration: InputDecoration(
                      hintText: 'Escribe ARL',
                      labelText: "ARL",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe EPS';
                      }
                      return null;
                    },
                    controller: _EPS,
                    decoration: InputDecoration(
                      hintText: 'Escribe EPS',
                      labelText: "EPS",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_claveFormulario.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: ElevatedButton(
                  child: const Text("Submit"),
                  // onPressed: () {},
                  onPressed: () => generateForm2PDF(
                      "formulario2.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      _nombre_tecnico.text,
                      SingingCharacter.rutinario == _character,
                      SingingCharacter.norutinario == _character,
                      SingingCharacter1.alturas == _character1,
                      SingingCharacter1.electrico == _character1,
                      _descripcion.text,
                      _nombre_apellido.text,
                      _cargo.text,
                      _cedula.text,
                      _ARL.text,
                      _EPS.text,
                      Get.find<ControllerForm2>()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/