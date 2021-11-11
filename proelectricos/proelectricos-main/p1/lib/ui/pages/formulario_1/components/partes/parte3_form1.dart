import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';

class Parte3Form1 extends StatefulWidget {
  Parte3Form1({Key? key, required this.trabajoRealizado}) : super(key: key);

  final TextEditingController trabajoRealizado;

  @override
  Parte3Form1State createState() {
    return Parte3Form1State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte3Form1State extends State<Parte3Form1> {
  late TextEditingController trabajoRealizado = widget.trabajoRealizado;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Rellene todos los campos';
            }
            return null;
          },
          controller: trabajoRealizado,
          minLines: 2,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Describa trabajo realizado',
            labelText: '',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: proElectricosBlue)),
          ),
        ),
      ],
    );
  }
}
