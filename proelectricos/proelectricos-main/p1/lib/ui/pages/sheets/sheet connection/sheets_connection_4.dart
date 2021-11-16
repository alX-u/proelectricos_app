import 'package:gsheets/gsheets.dart';
import 'package:p1/ui/pages/sheets/form_4_sheet.dart';

class FormSheets4 {
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "appproelectricos-53634",
  "private_key_id": "1db10260a70ac902e37f0f22f6a1326ecb8c6be0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCWuWclg83jSQdL\nIWWicndIxCH29K/VGHa5uRAsEpRau8aafLiofeWFA1+hz08BDnr2TDxzYy1is7oy\nOPah7tviz+OdWtjVKpGRY62SLJgt05xEivxC/dYDoWVFgtgIcmMRQvS6jn1nfzJA\nO10b3z2pYFw9fssvjq1b2kwZ9oSbG5i7hF+fAgJt/zi7M/ek6RYt++cQEZrVv1l8\nSAAAUVj/VclfMLXXo2Q4CeehHrLBJX2c1XTYIFeuYxhYmCtsOHbml529bF3dxo04\ncNOHuvpmbF6nwlP3tIBFDD5CwSWoPkWRFibFqijpGM1dPjUBq/Pqy9Iwmrqy2tit\nFA2swM9dAgMBAAECggEAHgCi8RtHAQ645nIr7oW1i+UK08NKOvNnMroNZ5B9OoB1\nXKwl/9grt2n//9Ap7E5rGJr9T4S29JZNIpEnOv22hHQYXWrHjcsu9c9vLhE1a63b\nReOaqmUn1EosxATzJt9KLBX1bCtP+CmgIZwPgSxTdGNLiSwzmvBePtH54xMou00Z\nOZLSh+hafmnnTOVq/gs0cMQ2wlDmwYCE23bpDp3XwfW8+tGP/htnMN0H4hBMXEwt\nPjtSIRmnuK8TBJNLPAhO7KlZ7/jfok1IH4ISqjb5RHFAsyabyg5wmsnyIPECbPUq\nvGAetJcvecMMAQ20Y9Q7DgJlzQPiAYMFItiCxi9l0QKBgQDMsi7Tg80XqwHntAtJ\nZO5CtXHWl06lDBMyMgNY8oEddivvx5GdoqJxkNLbzhdaWSzM4MRR8wPtyDaZAZOo\nd12OZO7ptVI1Tn6hCKIJOZOJPyxANYPIbdQL26MYBTTKhWEOQco73Hmr2w8tuUGz\ndRvrhgDgzG8aDe/ye55o0YxpOQKBgQC8gECd3HPfHp/BtfO6fu2yuroNrL3MNQws\ntODJmc9wtbqTTKEC9g2b690qR0GAXiYq1aoqABF6HIQBSNzlKpLt+2iKt7K13bBU\n4gaTqt97hquBpUT+G53v8qNEMDOU0grbV8HVmvZDjwNv2uYi38291r+Bjtagm2ZM\nqRyZc3sLRQKBgEWLfDFMpE+YQAtytir3aaOsdcLMoWGd2p/BMjX0Hj3eOks66JQ/\n/yTKaXlYacK+bWQmMU0OXZVZ4oLVcE9aTqTkUe+BNS77PjaD8llkAGYu2l/uTpm4\nBsUImD6+9hKggjsPyx/PZl8nC98jA9luvk+ktYOqsUyO06j0qvs9xpCxAoGBAJaE\nZpRnExMnlfONAbh6X/1mgugmdkuYVEdii1gPfIgIZJn4B12g8g7+ENUQnuoMw7dS\nc5UkBtCV8oZAEzreewKSzNBvjMER6xpsfUnumJM/XrWgLW4myT9vZRUu1BFSgx7Q\nfVO+cERT7y+jAD76rIOY9cRTNWh7jf1K0C5r+uVtAoGBALazvr9QzuUespDfIlaz\nkqchO6bnqUaIMeYxDpKVUnAFBuKuQ5mFxCtdauJrBqhlkVDFJN6WL7aZ1Hu4dvk8\ncAT2gdnsa+GLAYKjNtt74J06n3mebLIvRcowXf2h/2vslUMUXasjlBNftzDwzI9E\n9EB0bRT5DGPVgTBOmawgZG/3\n-----END PRIVATE KEY-----\n",
  "client_email": "form4-sheets@appproelectricos-53634.iam.gserviceaccount.com",
  "client_id": "102724960796457263694",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/form4-sheets%40appproelectricos-53634.iam.gserviceaccount.com"
}
  ''';

  //Obtenemos el spreadsheetId del link del documento que creamos en Google Sheets
  static const sheetId = '1kK2OAp7ApcMTghH4OZDcc7dRszETcjF4XkAQW9FU8so';

  static final gsheets = GSheets(credentials);
  static Worksheet? form4Sheet;

  static Future init() async {
    try {
      //Inicializamos el archivo sheets específico que queremos
      final spreadsheet = await gsheets.spreadsheet(sheetId);
      form4Sheet = await _getWorkSheet(spreadsheet, title: 'formulario_4');
      //Declaramos cuáles son los atributos que aparecerán en la primera fila
      final attributes = form4Fields.getFields();
      //Agregamos los valores de la primera fila (el ! es para validar el null check)
      form4Sheet!.values.insertRow(1, attributes);
    } catch (e) {
      //Por si ocurre alguún error
      print('Error in initialization');
    }
}

static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insertar(List<Map<String, dynamic>> rowList) async {
    if (form4Sheet == null) return;
    try {
      form4Sheet!.values.map.appendRows(rowList, inRange: true);
    } catch (e) {
      print('La data no se pudo agregar.');
    }
  }
}