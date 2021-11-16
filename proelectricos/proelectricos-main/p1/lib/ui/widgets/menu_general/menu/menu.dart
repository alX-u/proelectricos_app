//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/encabezado.dart';
import 'package:p1/ui/widgets/menu_general/menu/opciones_menu.dart';

class MenuOptionsScreen extends StatefulWidget {
  final int jobNumber; // representa el número del trabajo de este menu
  const MenuOptionsScreen({Key? key, required this.jobNumber})
      : super(key: key);
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  @override
  AuthenticationController authentication_controller =
      Get.find<AuthenticationController>();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: '',
        backgroundColor: proElectricosBlue,
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Encabezado(
                size: size,
                text: "Hola, " +
                    authentication_controller.name +
                    " \n\n ¡Llena tus formularios!"),
            OpcionesMenu(jobNumber: widget.jobNumber),
          ],
        ),
      ),
    );
  }
}
