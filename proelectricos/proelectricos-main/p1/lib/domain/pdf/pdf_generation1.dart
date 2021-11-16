import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:p1/data/local_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

void modifyTextField(PdfDocument document, int index, String val) {
  (document.form.fields[index] as PdfTextBoxField).text = val;
  // (document.form.fields[index] as PdfTextBoxField).readOnly = true;
  (document.form.fields[index] as PdfTextBoxField).borderColor = PdfColor.empty;
}

void modifyBoolField(PdfDocument document, int index, bool val,
    {bool removeBorder = true}) {
  (document.form.fields[index] as PdfCheckBoxField).isChecked = val;
  // (document.form.fields[index] as PdfCheckBoxField).readOnly = true;
  if (removeBorder) {
    (document.form.fields[index] as PdfCheckBoxField).borderColor =
        PdfColor.empty;
  }
}

void generateForm1PDF(
  String filename,
  String fecha,
  String empresa,
  String municipio,
  String cliente,
  String jornada,
  String vehiculo,
  String distrito,
  String direccion,
  String numero,
  String horaInicio,
  String horaFinal,
  String descargo,
  String incidencia,
  String nic,
  String aviso,
  String numero2,
  String circuito,
  String mt,
  String ct,
  String tension,
  String supervisor,
  String celularsup,
  String agentedes,
  String celularagn,
  String nombre,
  String cedula,
  String cargo,
  String trabajo,
  bool preservacion,
  String material,
  String cantidad,
  String nuevo,
) async {
  var bytedatas = await rootBundle.load('assets/form1template_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);

  // Fecha
  modifyTextField(document, 0, fecha);
  // placa
  modifyTextField(document, 1, empresa);

  modifyTextField(document, 2, municipio);

  modifyTextField(document, 3, cliente);

  modifyTextField(document, 4, jornada);

  modifyTextField(document, 5, vehiculo);

  modifyTextField(document, 6, distrito);

  modifyTextField(document, 7, direccion);

  modifyTextField(document, 8, numero);

  modifyTextField(document, 9, horaInicio);

  modifyTextField(document, 10, horaFinal);

  modifyTextField(document, 11, descargo);

  modifyTextField(document, 12, incidencia);

  modifyTextField(document, 13, nic);

  modifyTextField(document, 14, aviso);

  modifyTextField(document, 15, numero2);

  modifyTextField(document, 16, circuito);

  modifyTextField(document, 17, mt);

  modifyTextField(document, 18, ct);

  modifyTextField(document, 19, tension);

  modifyTextField(document, 20, supervisor);

  modifyTextField(document, 21, celularsup);

  modifyTextField(document, 22, agentedes);

  modifyTextField(document, 23, celularagn);

  modifyTextField(document, 24, nombre);

  modifyTextField(document, 25, cedula);

  modifyTextField(document, 26, cargo);

  modifyTextField(document, 27, trabajo);

  // GruaCanasta
  if (preservacion == true) {
    modifyBoolField(document, 29, true, removeBorder: true);
    modifyBoolField(document, 28, false, removeBorder: true);
  } else {
    modifyBoolField(document, 28, true, removeBorder: true);
    modifyBoolField(document, 29, false, removeBorder: true);
  }

  //Certificados dieléctricas
  modifyTextField(document, 30, material);
  //Certificados izaje
  modifyTextField(document, 31, cantidad);

  modifyTextField(document, 32, nuevo);

  for (int i = 0; i < document.form.fields.count; i++) {
    document.form.fields[i].readOnly = true;
  }

  // Firma Supervisor
  final prefs = await SharedPreferences.getInstance();
  final stringSupervisorSignature = prefs.getString('supervisor_signature');
  var byteSupervisorSignature = base64.decode(stringSupervisorSignature!);

  //Load the image using PdfBitmap.
  final PdfBitmap supervisorImage = PdfBitmap(byteSupervisorSignature);
  //Draw the image to the PDF page.
  document.pages
      .add()
      .graphics
      .drawImage(supervisorImage, const Rect.fromLTWH(0, 0, 500, 200));

  // Firma Tecnico
  LocalPreferences lp = LocalPreferences();
  String cc = await lp.retrieveData<String>("cc") ?? "";
  var users = FirebaseFirestore.instance.collection("usuario");
  var document_id = users.doc().id;
  var query = users.where("cc", isEqualTo: int.parse(cc));
  QuerySnapshot user = await query.get();
  var user_ID = user.docs[0].id;
  final stringTechSignature = await users.doc(user_ID).get().then((value) {
    return value.data()!['firma']; // Access your after your get the data
  });

  var byteTechSignature = base64.decode(stringTechSignature);

  //Load the image using PdfBitmap.
  final PdfBitmap techImage = PdfBitmap(byteTechSignature);
  //Draw the image to the PDF page.
  document.pages
      .add()
      .graphics
      .drawImage(techImage, const Rect.fromLTWH(0, 0, 500, 200));

  String appDocs = await _localPath;
  // print(appDocs + "/" + filename);
  await File(appDocs + "/" + filename).writeAsBytes(document.save());

  document.dispose();
  print("pdf creado");
}
