import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte4Form1 extends StatefulWidget {
  const Parte4Form1(
      {Key? key,
      required this.preservacion,
      required this.material,
      required this.cantidad,
      required this.nuevo})
      : super(key: key);

  final bool preservacion;
  final TextEditingController material;
  final TextEditingController cantidad;
  final TextEditingController nuevo;
  @override
  Parte4Form1State createState() {
    return Parte4Form1State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte4Form1State extends State<Parte4Form1> {
  late bool preservacion = widget.preservacion;
  late TextEditingController material = widget.material;
  late TextEditingController cantidad = widget.cantidad;
  late TextEditingController nuevo = widget.nuevo;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        CheckboxListTile(
          title: const Text(
              'Se evidencia preservación y conservación de la propiedad del cliente'),
          secondary: const Icon(Icons.construction),
          value: preservacion,
          onChanged: (bool? value) {
            setState(() {
              preservacion = value!;
            });
          },
          activeColor: proElectricosBlue,
          checkColor: Colors.white,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Material',
          cont: material,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Cantidad',
          cont: cantidad,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Nuevo',
          cont: nuevo,
        ),
      ],
    );
  }
}
