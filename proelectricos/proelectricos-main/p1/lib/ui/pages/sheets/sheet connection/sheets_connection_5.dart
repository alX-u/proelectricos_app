import 'package:gsheets/gsheets.dart';
import 'package:p1/ui/pages/sheets/form_5_sheet.dart';

class FormSheets5 {
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "appproelectricos-53634",
  "private_key_id": "13643e871b75ad9b4aab57009195de27652c1346",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCoE9HOURiCUgH1\ncSHWOiHhpb+zEVMDQaxcLZ5msbbZEvDOWnGdP5fgwl4mSWC7saojMCa3Gehr5JMq\ngI4xv+GYPy/f6VOjpMuEcFY49KTRLgPWLuXD/W878TipSodD67RntdqvHc6iXhCP\nm8ZzOM3THq1MFNeyLHZClBdk/qEpe/iGFi4NxMOLWsvq7NOw7+ljJ1/ofJrCiPUE\nZ58WZqCuvoJdxe/MsmRoiQmIAPK8CawMdwe44XkVaaF+W8aNuCcOUToJe09o7aTX\nkTVNgfa2jgnVzIRHlVtMJPfMtFjY+Y1pA5mr9aGKCPJbnX6JYm+qTfwgoYHBMr+c\nV1O0UESnAgMBAAECggEAIAiK+5nsJGZR1kAGFWjF7VYkN5ItMpkxKu5M2sCzGyMn\nfwSw06n7ncwdmolwpMUjKoqyTkJjUDDjtX2D3Ep4SgZ87t1u4ej2Gts4K6nAwddV\nxtvwUY67RP7f8C/yoMjK/NslfyucpshrupsTUwF4BO07VR1B0MT1kxHbdZWsDJYz\nFE30F6OhNQ0W3QOj2gZnsXq4naurSfHout2O7Rz+T/tmBRCw++gPBzFD9kyVLYj4\nj5dsGGn5F4iyTePKpvSQtYxAHLvdkbcOX9dpBb+zvEsHQIc/Dj0w0UDf+M1XwX07\nrP6wszkb+QJq2hZps3g9OZsPo3FVLKWXk/wyXBhe4QKBgQDmHpGyd262wLlPl2mx\n9HC6DuLP7nApoBKmtymtvVdKYt6OdBE5ETJZ3xuABMfVYGnNx0X3c5fw+R4dFqgQ\nMRIl9MEzzzYrm/u6IfLYalAwC/DrLLHvlG6WRIoTteyXaPPz5F+hS1A3W26CKy62\nfQeLEnpYmv+9sQFWEPAJCKGYxwKBgQC6+vuF74ShGqOzb8vKlfMad5AeDecpS5e7\nBm8gTLvElWX7y1Ef8cglXEKGJmXQ5ZEhRN/TVJX1piRvejKB418l0Lt9/mxnNXhI\ntEpyTVYgEXnDk7obQOoPgwPlO60W9XVjsSt+REOA3kNLPE3zrO3KfsE37i4wXL+w\nHpY6z7LVIQKBgBNg+aYM1r7/JdvlBVqeGiwg+srF6p4mw8tUW2ctLb+u6c0XSygC\nIbpdxoQWYvm+H8rbgDHhgycg439RnB+Y8k1N+kMxrP8pKJ65IylEcrJJHyW+4tEp\nL9LpvLMCPAVYKkscrUz4+a1fvsOpfUqS5uK4UKNLkkPYNyOXU49/MZSbAoGBAJme\now/DXaBPFrfR3gkvcXAJU2qd2ZHf/WU3QA21fX9hj0x0Gs64AsxPJIi6+2PJeJdw\n0sP59srAGadNKjn06LNU7vXxFnclQxHYrmGCkIQAV54LvRevGZ5s8cJgaTE3sZ6a\nbTVsOFmkQn2JqjHNngCEa5LcKS6qxQKZ3qurAS6BAoGAfL7rHTLc2jlS0u5Sd9Ud\n219bV1oYO2JWEZIrX4dDbuEdiPNn3hH0cnHWL6/GhirVeZHU9V7Kxy58aTmul/+5\nrl2LbBZ7Wh3FlQ7AEoKq3yQkGKpoii6d0MHTUjuVNUiOS9ckZ8PLLQ87Pea1j84r\nvthsvzX+XXEuAw0YeLyLqcg=\n-----END PRIVATE KEY-----\n",
  "client_email": "form5-sheets@appproelectricos-53634.iam.gserviceaccount.com",
  "client_id": "111694056268747865654",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/form5-sheets%40appproelectricos-53634.iam.gserviceaccount.com"
}
  ''';

  //Obtenemos el spreadsheetId del link del documento que creamos en Google Sheets
  static const sheetId = '1bwT071-lni040Pt7bYH3RBb2AzR6oFuLXFofzWqJRig';

  static final gsheets = GSheets(credentials);
  static Worksheet? form5Sheet;

  static Future init() async {
    try {
      //Inicializamos el archivo sheets específico que queremos
      final spreadsheet = await gsheets.spreadsheet(sheetId);
      form5Sheet = await _getWorkSheet(spreadsheet, title: 'formulario_5');
      //Declaramos cuáles son los atributos que aparecerán en la primera fila
      final attributes = form5Fields.getFields();
      //Agregamos los valores de la primera fila (el ! es para validar el null check)
      form5Sheet!.values.insertRow(1, attributes);
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
    if (form5Sheet == null) return;
    try {
      form5Sheet!.values.map.appendRows(rowList, inRange: true);
    } catch (e) {
      print('La data no se pudo agregar.');
    }
  }
}