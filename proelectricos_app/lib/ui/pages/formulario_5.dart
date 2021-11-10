/*import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/formularios/tabla_peligro_form5.dart';
import 'package:p1/domain/controller/controller_tabla_form5.dart';
import 'package:p1/ui/widgets/formularios/rellenar.dart';
import 'package:get/get.dart';

class FormularioCinco extends StatefulWidget {
  const FormularioCinco({Key? key}) : super(key: key);
  //DataTimePickerPage() : super();
  @override
  FormularioCincoPage createState() => FormularioCincoPage();
}

enum SingingCharacter { grua, canasta }
enum SingingCharacter1 { si, no }
enum SingingCharacter2 { yes, not }

class FormularioCincoPage extends State<FormularioCinco> {
  DateTime pickedDate = DateTime.now();
  SingingCharacter? _character = SingingCharacter.grua;
  SingingCharacter1? _character1 = SingingCharacter1.si;
  SingingCharacter2? _character2 = SingingCharacter2.yes;
  final _claveFormulario = GlobalKey<FormState>();
  final TextEditingController _descripcion = TextEditingController();
  final TextEditingController _nombre_tecnico = TextEditingController();
  final TextEditingController _nombre_apellido = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _ARL = TextEditingController();
  final TextEditingController _EPS = TextEditingController();
  
  @override
  void initState() {
    Get.put(ControllerTablaForm2());
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
        title: Text('Inspección preoperacional de carro canasta'),
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
                'Tipo de vehiculo',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Grua'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.grua,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Canasta'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.canasta,
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
                'Tecnico mecanica vigente:',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Sí'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.si,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.no,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                'SOAT vigente:',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Sí'),
              leading: Radio<SingingCharacter2>(
                value: SingingCharacter2.yes,
                groupValue: _character2,
                onChanged: (SingingCharacter2? value) {
                  setState(() {
                    _character2 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio<SingingCharacter2>(
                value: SingingCharacter2.not,
                groupValue: _character2,
                onChanged: (SingingCharacter2? value) {
                  setState(() {
                    _character2 = value;
                  });
                },
              ),
            ),
            
            Container(
              child: RellenarForm(),
            ),
            Align(
                  child: TablaPeligroForm2(),
                  alignment: Alignment.center,
                ),
            Container(
              child: RellenarForm2(),
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
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/