import 'package:flutter/material.dart';

class Parte3Form4 extends StatefulWidget {
  Parte3Form4(
      {Key? key,
      required this.trabajoRealizado,
      required this.desenergizado,
      required this.energizado})
      : super(key: key);

  final TextEditingController trabajoRealizado;
  final bool desenergizado;
  final bool energizado;

  @override
  Parte3Form4State createState() {
    return Parte3Form4State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte3Form4State extends State<Parte3Form4> {
  late TextEditingController trabajoRealizado = widget.trabajoRealizado;
  late bool desenergizado = widget.desenergizado;
  late bool energizado = widget.energizado;
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
                borderSide: BorderSide(color: Color(0xff264F95))),
          ),
        ),
        CheckboxListTile(
          title: const Text('Trabajo eléctrico desenergizado'),
          secondary: const Icon(Icons.engineering_outlined),
          value: desenergizado,
          onChanged: (bool? value) {
            setState(() {
              desenergizado = value!;
            });
          },
          activeColor: const Color(0xff264F95),
          checkColor: Colors.white,
        ),
        CheckboxListTile(
          title: const Text('Trabajo eléctrico energizado'),
          secondary: const Icon(Icons.engineering_outlined),
          value: energizado,
          onChanged: (bool? value) {
            setState(() {
              energizado = value!;
            });
          },
          activeColor: const Color(0xff264F95),
          checkColor: Colors.white,
        ),
      ],
    );
  }
}
