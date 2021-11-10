import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/data/local_preferences.dart';

class AuthenticationController extends GetxController {
  LocalPreferences lp = LocalPreferences();

  var _logged = false.obs;
  var _name = "".obs;
  var _cc = "".obs;
  var _password = "".obs;

  bool get logged => _logged.value;
  String get name => _name.value;
  String get cc => _cc.value;
  String get password => _password.value;

  void setLogged(bool l) {
    _logged.value = l;
    update();
  }
  void setname(String l) {
    _name.value = l;
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

    //setLogged(false);
  }


  Future<bool> login(cc, password) async {
    //Collection Reference para acceder a la colección "usuarios" de nuestra base de datos
    var cr = FirebaseFirestore.instance
        .collection("usuario");
    //Realizamos la consulta sobre la colección
    var query = cr
        .where("cc", isEqualTo: int.parse(cc))
        .where("password", isEqualTo: password);
    //Extraemos los datos de el query en cuestión
    QuerySnapshot users = await query.get();
    //Revisamos que exista algún usuario que cumpla con las condiciones
    if (users.docs.isNotEmpty) {
      Map<String,dynamic> datos = users.docs[0].data() as Map<String,dynamic>;

      String name = datos['nombre'] ?? '';
      int c = datos['cc'] ?? 0;
      String  password = datos['password'] ?? '';
      String  email = datos['email'] ?? '';

      String cc = c.toString();

      await lp.storeData<bool>("logged", true);
      await lp.storeData<String>("name", name);
      await lp.storeData<String>("cc", cc);
      await lp.storeData<String>("password", password);

      setLogged(true);
      setname(name);
      setcc(cc);
      setpassword(password);
    }
    else{
      await lp.storeData<bool>("logged", false);
      //_logged.value = false;
      setLogged(false);
    }
    return Future.value(_logged.value);
  }

  Future<bool> logout() async {
    await lp.storeData<bool>("logged", false);
    //_logged.value = false;
    setLogged(false);

    await lp.storeData<String>("name", "");
    await lp.storeData<String>("cc", "");
    await lp.storeData<String>("password", " ");
    //_logged.value = true;
    setname("");
    setcc("");
    setpassword("");
    return Future.value(true);
  }
}
