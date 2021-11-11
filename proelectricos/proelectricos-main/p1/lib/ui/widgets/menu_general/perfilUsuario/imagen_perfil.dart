//Esto basicamente contiene lel códio de cómo se pone la imagen en el perfil
import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';

class ImagenPerfil extends StatelessWidget {
  const ImagenPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          //Imagen
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/welcome2.png"))),
          ),
          //Botón al lado de la imagen que dice editar
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: proElectricosBlue,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
