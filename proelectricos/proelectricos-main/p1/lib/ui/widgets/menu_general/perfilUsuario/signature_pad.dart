import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/data/local_preferences.dart';
import 'package:signature/signature.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyButton extends StatefulWidget {
  final String text;
  final String agent;
  final Icon icon;
  const MyButton(this.text, this.agent, this.icon);
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: const Color(0xff264F95),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: () {
          if (widget.text == 'Cambiar firma' &&
              widget.agent == 'tech_signature') {
            Get.toNamed("/UpdateSignaturePad", arguments: widget.agent);
          } else {
            Get.toNamed("/SignaturePad", arguments: widget.agent);
          }
        },
        child: Row(
          children: [
            widget.icon,
            //Separación del borde
            const SizedBox(width: 10),
            Expanded(child: Text(widget.text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class SignaturePad extends StatefulWidget {
  final String agent = Get.arguments;
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late SignatureController controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Firma",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          //Te regresa a la ruta inmediatamente anterior
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller: controller,
            backgroundColor:
                Color(int.parse("#FFCFD8DC".replaceAll('#', '0xff'))),
          ),
          SizedBox(
            child: buildButtons(context),
          ),
        ],
      ));

  Widget buildButtons(BuildContext context) => Container(
        color: Color(int.parse("#FFB0BEC5".replaceAll('#', '0xff'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCheck(context),
            buildClear(),
          ],
        ),
      );

  Widget buildCheck(BuildContext context) => IconButton(
        iconSize: 36,
        icon: Icon(Icons.check, color: Colors.green),
        onPressed: () async {
          if (controller.isNotEmpty) {
            final exportController = SignatureController(
              penStrokeWidth: 2,
              penColor: Colors.black,
              exportBackgroundColor: Colors.white,
              points: controller.points,
            );

            final signature = await exportController.toPngBytes();
            final prefs = await SharedPreferences.getInstance();
            if (signature != null) {
              prefs.setString(widget.agent, base64.encode(signature));
            }
            exportController.dispose();
            // Get.toNamed("/SignaturePreview", arguments: widget.agent);
            Get.back();
            controller.clear();
          }
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );
}

class updateSignaturePad extends StatefulWidget {
  final String agent = Get.arguments;
  @override
  _updateSignaturePadState createState() => _updateSignaturePadState();
}

class _updateSignaturePadState extends State<updateSignaturePad> {
  late SignatureController controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Firma",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          //Te regresa a la ruta inmediatamente anterior
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller: controller,
            backgroundColor:
                Color(int.parse("#FFCFD8DC".replaceAll('#', '0xff'))),
          ),
          SizedBox(
            child: buildButtons(context),
          ),
        ],
      ));

  Widget buildButtons(BuildContext context) => Container(
        color: Color(int.parse("#FFB0BEC5".replaceAll('#', '0xff'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCheck(context),
            buildClear(),
          ],
        ),
      );

  Widget buildCheck(BuildContext context) => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.check, color: Colors.green),
        onPressed: () async {
          if (controller.isNotEmpty) {
            final exportController = SignatureController(
              penStrokeWidth: 2,
              penColor: Colors.black,
              exportBackgroundColor: Colors.white,
              points: controller.points,
            );

            final signature = await exportController.toPngBytes();
            if (signature != null) {
              LocalPreferences lp = LocalPreferences();
              String cc = await lp.retrieveData<String>("cc") ?? "";
              var users = FirebaseFirestore.instance.collection("usuario");
              var document_id = users.doc().id;
              var query = users.where("cc", isEqualTo: int.parse(cc));
              QuerySnapshot user = await query.get();
              var user_ID = user.docs[0].id;
              users.doc(user_ID).update({"firma": base64.encode(signature)});

              // prefs.setString(widget.agent, base64.encode(signature));
            }
            exportController.dispose();
            // Get.toNamed("/SignaturePreview", arguments: widget.agent);
            Get.back();
            controller.clear();
          }
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );
}

class SignaturePreview extends StatefulWidget {
  @override
  _SignaturePreviewState createState() => _SignaturePreviewState();
}

class _SignaturePreviewState extends State<SignaturePreview> {
  String _signature = "";
  @override
  void initState() {
    super.initState();
    _getSignature();
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.portraitDown,
      // DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  Future<void> _getSignature() async {
    LocalPreferences lp = LocalPreferences();
    String cc = await lp.retrieveData<String>("cc") ?? "";
    var users = FirebaseFirestore.instance.collection("usuario");
    var document_id = users.doc().id;
    var query = users.where("cc", isEqualTo: int.parse(cc));
    QuerySnapshot user = await query.get();
    var user_ID = user.docs[0].id;
    final sig = await users.doc(user_ID).get().then((value) {
      return value.data()!['firma']; // Access your after your get the data
    });
    setState(() => _signature = sig);

    // final prefs = await SharedPreferences.getInstance();
    // final sig = prefs.getString();
    // if (sig != null) {
    //   setState(() => _signature = sig);
    // }
  }

  _SignaturePreviewState() {
    _getSignature();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Vista Previa",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          //Te regresa a la ruta inmediatamente anterior
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: _signature == ''
            ? const Text('Cargando ...')
            : Image.memory(
                base64.decode(_signature),
              ),
      ),
    );
  }
}
