import 'package:flutter/material.dart';
import 'package:p1/ui/pages/formulario_5/components/formulario_5.dart';
import 'package:p1/ui/pages/widgetsReutilizables/comp_textformfield.dart';

class Parte1Form5 extends StatefulWidget {
  Parte1Form5(
      {Key? key,
      required this.pickedDate,
      required this.placa,
      required this.certDiel,
      required this.certIz,
      required this.character,
      required this.character1,
      required this.character2})
      : super(key: key);

  DateTime pickedDate = DateTime.now();
  final TextEditingController placa;
  final TextEditingController certDiel;
  final TextEditingController certIz;
  final SingingCharacter? character;
  final SingingCharacter1? character1;
  final SingingCharacter2? character2;

  @override
  Parte1Form5State createState() {
    return Parte1Form5State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form5State extends State<Parte1Form5> {
  late DateTime pickedDate = widget.pickedDate;
  late SingingCharacter? character = widget.character;
  late SingingCharacter1? character1 = widget.character1;
  late SingingCharacter2? character2 = widget.character2;
  late TextEditingController placa = widget.placa;
  late TextEditingController certDiel = widget.certDiel;
  late TextEditingController certIz = widget.certIz;

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
    return Column(
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
          labelText: 'Placa',
          cont: placa,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Tipo de vehiculo',
            style: TextStyle(height: 3, fontSize: 15),
          ),
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Grua'),
          value: SingingCharacter.grua,
          groupValue: character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Canasta'),
          value: SingingCharacter.canasta,
          groupValue: character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              character = value;
            });
          },
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Técnico mecánica vigente',
            style: TextStyle(height: 3, fontSize: 15),
          ),
        ),
        RadioListTile<SingingCharacter1>(
          title: const Text('Sí'),
          value: SingingCharacter1.si,
          groupValue: character1,
          onChanged: (SingingCharacter1? value) {
            setState(() {
              character1 = value;
            });
          },
        ),
        RadioListTile<SingingCharacter1>(
          title: const Text('No'),
          value: SingingCharacter1.no,
          groupValue: character1,
          onChanged: (SingingCharacter1? value) {
            setState(() {
              character1 = value;
            });
          },
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'SOAT vigente',
            style: TextStyle(height: 3, fontSize: 15),
          ),
        ),
        RadioListTile<SingingCharacter2>(
          title: const Text('Sí'),
          value: SingingCharacter2.yes,
          groupValue: character2,
          onChanged: (SingingCharacter2? value) {
            setState(() {
              character2 = value;
            });
          },
        ),
        RadioListTile<SingingCharacter2>(
          title: const Text('No'),
          value: SingingCharacter2.not,
          groupValue: character2,
          onChanged: (SingingCharacter2? value) {
            setState(() {
              character2 = value;
            });
          },
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Certificados de pruebas dieléctricas vigentes',
          cont: certDiel,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Certificado de izajes vigentes',
          cont: certIz,
        ),
      ],
    );
  }
}
