import 'package:flutter/material.dart';
import 'package:p1/ui/pages/widgetsReutilizables/comp_textformfield.dart';

class Parte2Form1 extends StatefulWidget {
  Parte2Form1(
      {Key? key,
      required this.nombre,
      required this.cedula,
      required this.cargo})
      : super(key: key);

  final TextEditingController nombre;
  final TextEditingController cedula;
  final TextEditingController cargo;

  @override
  Parte2Form1State createState() {
    return Parte2Form1State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte2Form1State extends State<Parte2Form1> {
  late TextEditingController nombre = widget.nombre;
  late TextEditingController cedula = widget.cedula;
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
          labelText: 'Nombre completo',
          cont: nombre,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Cédula',
          cont: cedula,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Cargo a desempeñar',
          cont: cargo,
        ),
      ],
    );
  }
}
