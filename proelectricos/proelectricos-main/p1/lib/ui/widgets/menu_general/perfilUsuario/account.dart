//Aquí puedes acceder a tu cuenta y ver las cosas predeterminadas
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/imagen_perfil.dart';
import 'package:p1/ui/widgetReutilizables/boton_widget.dart';
import "package:p1/ui/widgets/autenticacion/login.dart";
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  AuthenticationController controller = Get.find<AuthenticationController>();
  WorkPageController work_controller = Get.find<WorkPageController>();

  void cerrarSesion(controller, context) {
    var value = controller.logout();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  bool showPassword = false;

  final nameController = TextEditingController();
  final ccController = TextEditingController();
  final emailController = TextEditingController();
  final arlController = TextEditingController();
  final epsController = TextEditingController();
  final telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Aquí va todo lo que va en la barra superior
      appBar: AppBar(
        backgroundColor: proElectricosBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          //Te regresa a la ruta inmediatamente anterior
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Perfil de usuario",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            )),
      ),
      //Termina todo lo que va en la barra superior

      //Esto es lo que va en el cuerpo de esta interfaz
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              //IMAGEN DE LA PARTE SUPERIOR
              //LLamamos a la clase que contiene este código
              const ImagenPerfil(),
              //Colocamos los campos que van abajo
              const SizedBox(
                height: 35,
              ),
              inputFile(
                  label: "Nombre completo:",
                  placeholder: controller.name,
                  controller: nameController),
              inputFile(
                  label: "Nombre completo:",
                  placeholder: controller.cc,
                  controller: ccController),
              inputFile(
                  label: "email:",
                  placeholder: controller.email,
                  controller: emailController),
              inputFile(
                  label: "arl:",
                  placeholder: controller.arl,
                  controller: arlController),
              inputFile(
                  label: "eps:",
                  placeholder: controller.eps,
                  controller: epsController),
              inputFile(
                  label: "tel:",
                  placeholder: controller.tel,
                  controller: telefonoController),

              //buildTextField("Nombre completo", controller.name, false),
              // buildTextField("CC", controller.cc, false),
              //buildTextField("Email", controller.email, false),
              //buildTextField("arl", controller.arl, false),
              //buildTextField("eps", controller.eps, false),
              //buildTextField("telefono", controller.tel, false),

              buildTextField("Contraseña", "********", true),

              //PARTE DE LA FIRMA
              //Llamamos a la clase BotonWidget
              const MyButton("Cambiar firma", "tech_signature",
                  Icon(Icons.feed, size: 0, color: Colors.black)),
              BotonWidget(
                text: "Ver firma",
                icon: const Icon(Icons.feed, size: 0, color: Colors.black),
                press: () => {Get.toNamed('/SignaturePreview')},
              ),
              BotonWidget(
                text: "Cerrar sesión",
                icon: const Icon(Icons.feed, size: 0, color: Colors.black),
                press: () => {cerrarSesion(controller, context)},
              ),

              const SizedBox(
                height: 35,
              ),
              //Parte de abajo que te da la opción de guardar o cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: const Text("Cancelar",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      print("Me presionaron");
                      String cc = ccController.text.trim();
                      String nombre = nameController.text.trim();
                      String email = emailController.text.trim();
                      //String password = passController.text.trim();
                      String arl = arlController.text.trim();
                      String eps = epsController.text.trim();
                      String telefono = telefonoController.text.trim();
                      controller.updateData(email, telefono, arl, eps);
                    },
                    color: proElectricosBlue,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Guardar",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //Widget para el textfield
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

Widget inputFile({label, placeholder, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: placeholder,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
