import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/data/local_preferences.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:shared_preferences/shared_preferences.dart';

final llave = enc.Key.fromLength(32);
final encrypter = enc.Encrypter(enc.AES(llave));
final iv = enc.IV.fromLength(16);

class AuthenticationController extends GetxController {

  LocalPreferences lp = LocalPreferences();

  var _logged = false.obs;
  var _name = "".obs;
  var _cc = "".obs;
  var _password = "".obs;
  var _email = "".obs;
  var _arl = "".obs;
  var _eps = "".obs;
  var _telefono = "".obs;
  var _firma = "".obs;



  bool get logged => _logged.value;
  String get name => _name.value;
  String get cc => _cc.value;
  String get password => _password.value;
  String get email => _email.value;
  String get arl => _arl.value;
  String get eps => _eps.value;
  String get tel => _telefono.value;
  String get firma => _telefono.value;

  void setLogged(bool l) {
    _logged.value = l;
    update();
  }
  void setfirma(String l) {
    _firma.value = l;
    update();
  }
  void setname(String l) {
    _name.value = l;
    update();
  }
  void setarl(String l) {
    _arl.value = l;
    update();
  }
  void seteps(String l) {
    _eps.value = l;
    update();
  }
  void settel(String l) {
    _telefono.value = l;
    update();
  }
  void setemail(String l) {
    _email.value = l;
    update();
  }

  void setcc(String l) {
    _cc.value = l;
    update();
  }

  void setpassword(String l) {
    _password.value = l;
    update();
  }

  AuthenticationController() {
    init();
  }

  void init() async {
    _logged.value = await lp.retrieveData<bool>("logged") ?? false;
    _name.value = await lp.retrieveData<String>("name") ?? "";
    _cc.value = await lp.retrieveData<String>("cc") ?? "";
    _password.value = await lp.retrieveData<String>("password") ?? "";
    _email.value = await lp.retrieveData<String>("email") ?? "";
    _arl.value = await lp.retrieveData<String>("arl") ?? "";
    _eps.value = await lp.retrieveData<String>("eps") ?? "";
    _telefono.value = await lp.retrieveData<String>("telefono") ?? "";
    _firma.value = await lp.retrieveData<String>("firma") ?? "";

  }

  Future<bool> login(cc, password) async {
    //Collection Reference para acceder a la colección "usuarios" de nuestra base de datos
    var cr = FirebaseFirestore.instance.collection("usuario");
    //Realizamos la consulta sobre la colección
    var query = cr
        .where("cc", isEqualTo: int.parse(cc))
        .where("password", isEqualTo: password);
    //Extraemos los datos de el query en cuestión
    QuerySnapshot users = await query.get();
    //Revisamos que exista algún usuario que cumpla con las condiciones
    if (users.docs.isNotEmpty) {
      Map<String, dynamic> datos = users.docs[0].data() as Map<String, dynamic>;

      String name = datos['nombre'] ?? '';
      int c = datos['cc'] ?? 0;
      String password = datos['password'] ?? '';
      String email = datos['email'] ?? '';

      String  arl = datos['arl'] ?? '';
      String  eps = datos['eps'] ?? '';
      String  telefono = datos['telefono'] ?? '';
      String  firma = datos['firma'] ?? '';

      String cc = c.toString();

      await lp.storeData<bool>("logged", true);
      await lp.storeData<String>("name", name);
      await lp.storeData<String>("cc", cc);
      await lp.storeData<String>("password", password);
      await lp.storeData<String>("email", email);
      await lp.storeData<String>("arl", arl);
      await lp.storeData<String>("eps", eps);
      await lp.storeData<String>("telefono", telefono);
      await lp.storeData<String>("firma", firma);

      setLogged(true);
      setname(name);
      setcc(cc);
      setpassword(password);
      setemail(email);
      setarl(arl);
      seteps(eps);
      settel(telefono);
      setfirma(firma);
    }
    else {
      await lp.storeData<bool>("logged", false);
      //_logged.value = false;
      setLogged(false);
    }
    return Future.value(_logged.value);
  }

  Future<void> register(cc,email,nombre,password,cPassword,firma,arl,telefono,eps,context) {
    var users =
    FirebaseFirestore.instance.collection("usuario");
    //Función encargada de añadir usuarios a la base de datos
    return users
        .add({
      "cc": int.parse(cc),
      "email": email,
      "nombre": nombre,
      "firma":firma,
      "arl":arl,
      "eps":eps,
      "telefono":telefono,
      "password":
      encrypter.encrypt(password, iv: iv).base64
    }).then((value) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Registro Exitoso"),
          content:
          const Text("Gracias por registrarse"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const HomePage()));
                },
                child: const Text('OK'))
          ],
        )))
        .catchError(
            (error) => debugPrint("Error al añadir usuario"));
  }

  Future<void> updateData(email_nuevo,tel_nuevo,arl_nuevo,eps_nueva) async {

    var users =
    FirebaseFirestore.instance.collection("usuario");
    //Realizamos la consulta sobre la colección
    var query = users
        .where("cc", isEqualTo: int.parse(cc));

    //Extraemos los datos de el query en cuestión
    QuerySnapshot user = await query.get();
    var user_ID = user.docs[0].id;
    print("Cambiare los datos del usuario:");
    print(user_ID);
    print(user.docs[0].data());
    return users
        .doc(user_ID)
        .update(
        {
          "cc": int.parse(cc),
          "email": (email_nuevo =="" ) ? email:email_nuevo ,
          "nombre": name,
          "firma":firma,
          "arl":(arl_nuevo =="" ) ? arl:arl_nuevo ,
          "eps": (eps_nueva =="" ) ? eps:eps_nueva,
          "telefono":(tel_nuevo =="" ) ? tel:tel_nuevo,
          "password":
          encrypter.encrypt(password, iv: iv).base64
        }
      ) // <-- Updated data
          .then((_) => print('Success'))
          .catchError((error) => print('Failed: $error'));

  }


  Future<bool> logout() async {
    await lp.storeData<bool>("logged", false);
    //_logged.value = false;
    setLogged(false);

    await lp.storeData<String>("name", "");
    await lp.storeData<String>("cc", "");
    await lp.storeData<String>("password", "");
    await lp.storeData<String>("email", "");
    await lp.storeData<String>("eps", "");
    await lp.storeData<String>("arl", "");
    await lp.storeData<String>("telefono", "");
    await lp.storeData<String>("firma", "");

    //_logged.value = true;
    setname("");
    setcc("");
    setpassword("");
    setemail("");
    seteps("");
    setarl("");
    settel("");
    setfirma("");

    return Future.value(true);
  }
}
