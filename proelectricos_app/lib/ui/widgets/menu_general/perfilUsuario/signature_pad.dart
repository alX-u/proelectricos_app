import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Get.toNamed("/SignaturePad", arguments: widget.agent);
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
    //SystemChrome.setPreferredOrientations([
    //  DeviceOrientation.landscapeRight,
    //  DeviceOrientation.landscapeLeft,
    //]);
    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    //SystemChrome.setPreferredOrientations([
    //  DeviceOrientation.landscapeRight,
    //  DeviceOrientation.landscapeLeft,
     // DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    //]);
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

class SignaturePreview extends StatefulWidget {
  final String agent = Get.arguments;
  @override
  _SignaturePreviewState createState() => _SignaturePreviewState();
}

class _SignaturePreviewState extends State<SignaturePreview> {
  String _signature = "";
  @override
  void initState() {
    super.initState();
    _getSignature();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    super.dispose();
  }

  Future<void> _getSignature() async {
    final prefs = await SharedPreferences.getInstance();
    final sig = prefs.getString(widget.agent);
    if (sig != null) {
      setState(() => _signature = sig);
    }
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
        child: Image.memory(
          base64.decode(_signature),
        ),
      ),
    );
  }
}
