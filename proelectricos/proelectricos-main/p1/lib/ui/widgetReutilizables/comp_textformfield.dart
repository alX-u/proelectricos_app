//Widget de cualquier botón que vaya en el perfil que te permita editar algo
import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';

//Constructor de los campos obligatorios que deben tener estos botones:
//El texto, el icono y hacia donde va el onPressed
class CompTextFormField extends StatelessWidget {
  const CompTextFormField(
      {Key? key,
      required this.casoVacio,
      required this.hintText,
      required this.labelText,
      required this.cont})
      : super(key: key);

  final String casoVacio;
  final String hintText;
  final String labelText;
  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return casoVacio;
          }
          return null;
        },
        controller: cont,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: proElectricosBlue)),
        ),
      ),
    );
  }
}
