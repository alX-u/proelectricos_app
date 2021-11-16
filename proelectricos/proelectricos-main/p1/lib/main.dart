// ignore_for_file: prefer_const_constructors
//El main llama al home donde se puede iniciar sesión o registrarse
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_1.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_2.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_3.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_4.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_5.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/ui/widgets/menu_trabajo/menu_trabajos.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
//import 'package:p1/ui/widgets/pdf/pdf_widget.dart';

void main() async {
  Get.put(AuthenticationController());
  WidgetsFlutterBinding.ensureInitialized();
  WorkPageController workC = WorkPageController();
  await workC.initController();
  Get.put(workC);

  await FormSheets.init();
  await FormSheets2.init();
  await FormSheets3.init();
  await FormSheets4.init();
  await FormSheets5.init();
  await Firebase.initializeApp().then((value) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      getPages: [
        GetPage(name: '/SignaturePad', page: () => SignaturePad()),
        GetPage(name: '/SignaturePreview', page: () => SignaturePreview()),
        GetPage(name: '/UpdateSignaturePad', page: () => updateSignaturePad()),
        GetPage(name: '/MenuTrabajos', page: () => MenuTrabajos()),
        GetPage(name: '/LoginPage', page: () => LoginPage()),
      ],
    ));
  });
}
