import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte1Form3 extends StatefulWidget {
  Parte1Form3(
      {Key? key,
      required this.pickedDate,
      required this.horaInicio,
      required this.horaFin,
      required this.lugarTrabajo,
      required this.ubicacion,
      required this.altura,
      required this.tipoTrabajoAltura})
      : super(key: key);

  DateTime pickedDate = DateTime.now();
  final TextEditingController horaInicio;
  final TextEditingController horaFin;
  final TextEditingController lugarTrabajo;
  final TextEditingController ubicacion;
  final TextEditingController altura;
  final TextEditingController tipoTrabajoAltura;

  @override
  Parte1Form3State createState() {
    return Parte1Form3State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form3State extends State<Parte1Form3> {
  late DateTime pickedDate = widget.pickedDate;
  late TextEditingController horaInicio = widget.horaInicio;
  late TextEditingController horaFin = widget.horaFin;
  late TextEditingController lugarTrabajo = widget.lugarTrabajo;
  late TextEditingController ubicacion = widget.ubicacion;
  late TextEditingController altura = widget.altura;
  late TextEditingController tipoTrabajoAltura = widget.tipoTrabajoAltura;

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
          labelText: 'Hora de inicio',
          cont: horaInicio,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Hora de fin',
          cont: horaFin,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Lugar de trabajo',
          cont: lugarTrabajo,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Ubicación donde se realiza el trabajo',
          cont: ubicacion,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: 'mts',
          labelText: 'Altura aprox. de desarrollo de act.',
          cont: altura,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Tipo de trabajo en altura',
          cont: tipoTrabajoAltura,
        ),
      ],
    );
  }
}
