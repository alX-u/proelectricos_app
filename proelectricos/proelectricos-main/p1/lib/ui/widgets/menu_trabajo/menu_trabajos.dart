//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgetReutilizables/encabezado.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:get/get.dart';

class MenuTrabajos extends StatefulWidget {
  // final String
  //     trabajoFolder; // carpeta interna de donde se guardan los trabajos, necesario para diferenciar trabajo 0 del trabajo 1
  const MenuTrabajos({Key? key}) : super(key: key);
  @override
  _MenuTrabajosState createState() => _MenuTrabajosState();
}

class _MenuTrabajosState extends State<MenuTrabajos> {
  AuthenticationController authentication_controller =
      Get.find<AuthenticationController>();
  WorkPageController controller = Get.find<WorkPageController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: '',
        backgroundColor: Color(0xff264F95),
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Encabezado(
              size: size,
              text: "Hola, " +
                  authentication_controller.name +
                  " \n\n Progreso diario"),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 8, left: 16),
            child: const Text("Área de trabajo",
                style: TextStyle(
                  color: Color(0xff264F95),
                  fontSize: 17,
                )),
          ),
          //En esta parte es donde va a estar el menú donde podemos agregar
          //nuevos trabajos
          //fit: FlexFit.tight,
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.centerLeft,
              child: authentication_controller.logged
                  ? Obx(() => ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: controller.joblist))
                  : Container(),
            ),
          )
        ],
      ),
    );
  }
}
