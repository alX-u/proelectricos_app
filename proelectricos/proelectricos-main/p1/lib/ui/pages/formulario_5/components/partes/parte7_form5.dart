import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte7Form5 extends StatefulWidget {
  const Parte7Form5(
      {Key? key, required this.kilometraje, required this.horometro})
      : super(key: key);

  final TextEditingController kilometraje;
  final TextEditingController horometro;

  @override
  Parte7Form5State createState() {
    return Parte7Form5State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte7Form5State extends State<Parte7Form5> {
  late TextEditingController kilometraje = widget.kilometraje;
  late TextEditingController horometro = widget.horometro;

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
          labelText: 'Kilometraje',
          cont: kilometraje,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Horometro',
          cont: horometro,
        ),
      ],
    );
  }
}
