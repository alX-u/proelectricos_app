import 'package:flutter/material.dart';
import 'package:p1/ui/pages/formulario_2/formulario_2.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte1Form2 extends StatefulWidget {
  Parte1Form2(
      {Key? key,
      required this.pickedDate,
      required this.nombre,
      required this.trabajo,
      required this.character,
      required this.character1})
      : super(key: key);

  DateTime pickedDate = DateTime.now();
  final TextEditingController nombre;
  final TextEditingController trabajo;
  final SingingCharacter? character;
  final SingingCharacter1? character1;

  @override
  Parte1Form2State createState() {
    return Parte1Form2State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form2State extends State<Parte1Form2> {
  late DateTime pickedDate = widget.pickedDate;
  late TextEditingController nombre = widget.nombre;
  late TextEditingController trabajo = widget.trabajo;
  late SingingCharacter? character = widget.character;
  late SingingCharacter1? character1 = widget.character1;

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
    // Build a Form widget using the _formKey created above.
    return Theme(
        data: ThemeData(
          unselectedWidgetColor: const Color(0xff264F95),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            ListTile(
              title: Text(
                "Fecha: ${pickedDate.day}/ ${pickedDate.month}/ ${pickedDate.year}",
                style: const TextStyle(fontSize: 15),
              ),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            CompTextFormField(
              casoVacio: 'Rellene todos los campos',
              hintText: '',
              labelText: 'Nombre de quién diligencia',
              cont: nombre,
            ),
            CompTextFormField(
              casoVacio: 'Rellene todos los campos',
              hintText: '',
              labelText: 'Trabajo a realizar',
              cont: trabajo,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Clasificacion del trabajo',
                style: TextStyle(height: 3, fontSize: 15),
              ),
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Rutinario'),
              value: SingingCharacter.rutinario,
              groupValue: character,
              activeColor: const Color(0xff264F95),
              onChanged: (SingingCharacter? value) {
                setState(() {
                  character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('No rutinario'),
              value: SingingCharacter.noRutinario,
              groupValue: character,
              activeColor: const Color(0xff264F95),
              onChanged: (SingingCharacter? value) {
                setState(() {
                  character = value;
                });
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'La actividad incluye',
                style: TextStyle(height: 3, fontSize: 15),
              ),
            ),
            RadioListTile<SingingCharacter1>(
              title: const Text('Trabajo en altura'),
              value: SingingCharacter1.tAltura,
              groupValue: character1,
              activeColor: const Color(0xff264F95),
              onChanged: (SingingCharacter1? value) {
                setState(() {
                  character1 = value;
                });
              },
            ),
            RadioListTile<SingingCharacter1>(
              title: const Text('Trabajo eléctrico'),
              value: SingingCharacter1.tElectrico,
              groupValue: character1,
              activeColor: const Color(0xff264F95),
              onChanged: (SingingCharacter1? value) {
                setState(() {
                  character1 = value;
                });
              },
            )
          ],
        ));
  }
}
