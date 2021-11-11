import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte1Form4 extends StatefulWidget {
  Parte1Form4(
      {Key? key,
      required this.pickedDate,
      required this.lider,
      required this.ubicacion,
      required this.contratista})
      : super(key: key);

  DateTime pickedDate = DateTime.now();
  final TextEditingController lider;
  final TextEditingController ubicacion;
  final TextEditingController contratista;

  @override
  Parte1Form4State createState() {
    return Parte1Form4State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form4State extends State<Parte1Form4> {
  late DateTime pickedDate = widget.pickedDate;
  late TextEditingController lider = widget.lider;
  late TextEditingController ubicacion = widget.ubicacion;
  late TextEditingController contratista = widget.contratista;

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
          labelText: 'Lider de cuadrilla',
          cont: lider,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Lugar y ubicación donde se realizo el trabajo',
          cont: ubicacion,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Contratista',
          cont: contratista,
        ),
      ],
    );
  }
}
