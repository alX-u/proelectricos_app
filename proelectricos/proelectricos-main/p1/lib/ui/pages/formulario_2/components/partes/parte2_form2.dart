import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte2Form2 extends StatefulWidget {
  const Parte2Form2(
      {Key? key,
      required this.nombreapellidos,
      required this.cedula,
      required this.arl,
      required this.eps,
      required this.cargo})
      : super(key: key);

  final TextEditingController nombreapellidos;
  final TextEditingController cedula;
  final TextEditingController arl;
  final TextEditingController eps;
  final TextEditingController cargo;

  @override
  Parte2Form2State createState() {
    return Parte2Form2State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte2Form2State extends State<Parte2Form2> {
  late TextEditingController nombreapellidos = widget.nombreapellidos;
  late TextEditingController cedula = widget.cedula;
  late TextEditingController arl = widget.arl;
  late TextEditingController eps = widget.eps;
  late TextEditingController cargo = widget.cargo;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Nombres y apellidos',
          cont: nombreapellidos,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Número de cédula',
          cont: cedula,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'ARL',
          cont: arl,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'EPS',
          cont: eps,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Cargo trabajador',
          cont: cargo,
        ),
      ],
    );
  }
}
