import 'package:p1/domain/controller/controller_tabla_form2.dart';
import 'package:flutter/services.dart' show rootBundle;
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

void generateForm2PDF(
    String filename,
    String fecha,
    String nombre,
    bool rutinario,
    bool nonRutinario,
    bool alturas,
    bool electrico,
    String trabajoRealizado,
    String nombreYapellido,
    String cargo,
    String cedula,
    String arl,
    String eps,
    ControllerTablaForm1 cont) async {
  var bytedatas = await rootBundle.load('assets/form1template_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);

  // for (int i = 0; i < document.form.fields.count; i++) {
  //   print(i);
  //   print(document.form.fields[i]);
  //   print("--------------");
  // }
  // Nombre
  modifyTextField(document, 0, nombre);
  // Rutinario
  modifyBoolField(document, 1, rutinario, removeBorder: false);
  // No Rutinario
  modifyBoolField(document, 2, nonRutinario, removeBorder: false);
  // Alturas
  modifyBoolField(document, 3, alturas, removeBorder: false);
  // Eléctrico
  modifyBoolField(document, 4, electrico, removeBorder: false);

  for (int i = 0; i < 59; i++) {
    modifyBoolField(document, (i) * 2 + 5 + (!cont.si[i].value ? 1 : 0), true);
    modifyBoolField(document, (i) * 2 + 5 + (cont.si[i].value ? 1 : 0), false,
        removeBorder: true);
  }

  // nombre y apellido
  modifyTextField(document, 123, nombreYapellido);
  // cargo
  modifyTextField(document, 124, cargo);
  // cedula
  modifyTextField(document, 125, cedula);
  // ARL
  modifyTextField(document, 126, arl);
  // EPS
  modifyTextField(document, 127, eps);
  // Fecha
  modifyTextField(document, 128, fecha);
  // Trabajo Realizado
  modifyTextField(document, 129, trabajoRealizado);

  for (int i = 0; i < document.form.fields.count; i++) {
    document.form.fields[i].readOnly = true;
  }
  String appDocs = await _localPath;
  // print(appDocs + "/" + filename);
  await File(appDocs + "/" + filename).writeAsBytes(document.save());

  document.dispose();
}
