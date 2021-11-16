import 'package:flutter/material.dart';
import 'package:p1/common/constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:shared_preferences/shared_preferences.dart';

final llave = enc.Key.fromLength(32);
final encrypter = enc.Encrypter(enc.AES(llave));
final iv = enc.IV.fromLength(16);

class SignupPage extends StatelessWidget {
  AuthenticationController controller = Get.find<AuthenticationController>();

  SignupPage({Key? key}) : super(key: key);
  final ccController = TextEditingController();
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final arlController = TextEditingController();
  final telefonoController = TextEditingController();
  final epsController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: proElectricosBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: proElectricosBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text(
                    "Registro de cuenta",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "¡Crea tu cuenta!",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            /*CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Cédula',
                              cont: ccController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Nombre',
                              cont: nombreController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Email',
                              cont: emailController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Teléfono',
                              cont: telefonoController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'ARL',
                              cont: arlController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'EPS',
                              cont: epsController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Contraseña',
                              cont: passController,
                            ),
                            CompTextFormField(
                              casoVacio: '',
                              hintText: '',
                              labelText: 'Confirmar contraseña',
                              cont: confirmpassController,
                            ),*/
                            inputFile(
                                label: "Cédula:", controller: ccController),
                            inputFile(
                                label: "Nombre:", controller: nombreController),
                            inputFile(
                                label: "Email:", controller: emailController),
                            inputFile(
                                label: "Teléfono:",
                                controller: telefonoController),
                            inputFile(label: "arl:", controller: arlController),
                            inputFile(label: "eps:", controller: epsController),
                            inputFile(
                                label: "Contraseña:",
                                obscureText: true,
                                controller: passController),
                            inputFile(
                                label: "Confirmar contraseña:",
                                obscureText: true,
                                controller: confirmpassController),
                            sigButton(),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              //Extraemos la firma del sharedPreferences
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final sig = prefs.getString('tech_signature');

                              //Extraemos la información de los textboxes
                              String cc = ccController.text.trim();
                              String nombre = nombreController.text.trim();
                              String email = emailController.text.trim();
                              String password = passController.text.trim();
                              String arl = arlController.text.trim();
                              String eps = epsController.text.trim();
                              String telefono = telefonoController.text.trim();
                              String cPassword =
                                  confirmpassController.text.trim();
                              String firma = sig!;
                              //Validamos que cada campo esté llenado
                              if (cc.isEmpty) {
                                debugPrint("Ingrese una cédula, por favor");
                              } else if (nombre.isEmpty) {
                                debugPrint("Ingrese un nombre, por favor");
                              } else if (email.isEmpty) {
                                debugPrint("Ingrese un e-mail, por favor");
                              } else if (password.isEmpty) {
                                debugPrint(
                                    "Recuerde ingresar una contraseña, por favor");
                              } else if (cPassword.isEmpty) {
                                debugPrint("Confirme su contraseña, por favor");
                              }
                              //Validamos que las contraseñas sean iguales
                              if (password != cPassword) {
                                debugPrint("Las contraseñas no son iguales");
                              }
                              //Obtenemos la referencia a la collection "usuario"

                              controller.register(
                                  cc,
                                  email,
                                  nombre,
                                  password,
                                  cPassword,
                                  firma,
                                  arl,
                                  telefono,
                                  eps,
                                  context);
                            },
                            color: proElectricosBlue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Text(
                              "Registrarse",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("¿Ya tiene una cuenta?"),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text(
                                " Inicie sesión",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, controller}) {
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: proElectricosBlue)),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget sigButton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const <Widget>[
      Text(
        'Firma:',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      MyButton("Añadir Firma", "tech_signature",
          Icon(Icons.feed, size: 0, color: Colors.black)),
      SizedBox(
        height: 10,
      )
    ],
  );
}
