import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

Future<void> uploadFile(String filePath) async {
  File file = File(filePath);

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('formularios/formulario2.pdf')
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print("Failed to upload file!");
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

void uploadPdf2() async {
  // Check that PDF1 exists.
  String appDocs = await _localPath;
  String form2path = appDocs + "/formulario2.pdf";
  if (await File(form2path).exists()) {
    // upload pdf
    await uploadFile(form2path);
    // delete pdf
    await File(form2path).delete();
  } else {
    print("Generate PDF2 first!");
  }
}
