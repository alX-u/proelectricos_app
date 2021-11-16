import 'package:gsheets/gsheets.dart';
import 'package:p1/ui/pages/sheets/form_2_sheet.dart';

class FormSheets2 {
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "appproelectricos-53634",
  "private_key_id": "08e42fef9019669a25af6a582b56bc3da9affd76",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCyURtMThGPi5Ie\nJWum4tW0byvYm6mAGpz5aeI6Kfv50OpU6LZUKlG2dmDJVuplU17tWVdQJZN98p8I\niqffcg3yWHTvqtqzMz35zHByHEO6KU+hnXHgPDob26n7CzW7T/wV2rKUvuMJ7vI7\nYa5sfRjSesH3lz+wuht+H0nrR5fa7ITspA9vPuCHGz6gCKBHGo8+f0N0FErB+m16\ntqdZUSnPscPFeK85V8h7yi2uuGzSUKDNIsaNn9Y00JAIjH7JptlBdFpQEMHedFta\n2lmiwGY8oaB7UUWi8XrD4CXHR7NK9YtUwcBRnaS2Mugk11UgIWcrPLCYjPAmzTy2\nXS5gVLY5AgMBAAECggEANGX0+ZUvP9kplMY2PhIF7kGExt/nDQfE/N2KZsETlDM5\nyL2hZlYRMObURhXORvwatvA74gdIsgfrh50G+3gOdRpdMlgob+Qs4AydNkrr8/ZT\nuhAD+Hp6MNl5t5VxspssXlenhmIZYT/f2mc31BVmh+MewFynkIz/qy4SkJq3GtNM\nIaKblCStbH57rHSszRgoviNuC/BpWmvfwArm3aA1gh+1c6oGpNFVtcxm0VjW0PTp\nOs/DdvkI+eXyRNnXB3utm1bN0+im3BPyIoQ+3fq2XyRtC7YQafQdLp3mQq8VE+ZP\nVVMnxMuEVAh0jAJlnG4P3oT7wKs3p7ugdxXi1Wo4SQKBgQDXhuLMeeNvmaqN5po7\nCe37qJbTGtplU4yERNy6kfAA7Z5kcDTMh2ZcJidNw+Q4TVAV8U7yPjGJwtAf5PHJ\nfRcUqnJdgksBz1zij5ucIAWa5LCzxE8Ra7i3VDPjwRFyQjluIVpxHGBaqd3T7P2q\nJKkSkj+9v8d1wVUsQrW85vYYZwKBgQDTzWfBeRAFefoWHLoEVbNYS0ccQ6iVqUZ0\nXUv34olX21VJHX5zf+81oZ5YyD6gzvgPE4oMbJ2z6DE/lPDFEuLqYdRgXDc8tnEr\n35rsYSFOfvWTJMTXS9GzGjyOldBFntl5wLQaVA//bR9yU+Ll/jZ42onn5dbIEa2o\n43HtDogYXwKBgQDIHBweABnUd5essuyGXnzRCUIodalLJRy1fn5216NAKV/EH45W\nTG0Up/QcNwKB5/6wsOE899Pk9bVpt5drHbK9ZFhVS/E6l/7E+NNhTTYHD8ik0GMd\naKgTx6F6GLuLG8PY5izkEpW/+DHXYBZR0EIO1S1Lj3GxerULKFE3ODZMhwKBgGtF\nFM+AKQUdCfQ5CF05qmOFfLZr7e4elXhJ6DfbnAPLKh6luW111gkrma8Ne+ql6Cx6\nkOhJ+nUrnAW/wVGOhy597bn/+lndbOPzk9s0NlIzKt0jOi5wT/yNxS3R4nHgSfTI\nDG9pM9EBy3Nz2O7zGVOMG1w/o9AgY/utdf3B5luxAoGBAMlfAUkCJMKL/ws1ZCxT\nq+9DcCTTCrk0PYpuZb94pLyzYKebnTXQvG1P+nHyjpybMXhm3vtyNsae12H0Hlmo\n5yclhESprQ4G+hsR2pOuvBmaZ/aWzlSS2o6zYCrSU8fvlQop1uqrAmJ75pQ7TTuW\nbhKV+1XWoJPGKgwGm5dcqlKw\n-----END PRIVATE KEY-----\n",
  "client_email": "form2-sheets@appproelectricos-53634.iam.gserviceaccount.com",
  "client_id": "115350557279458307265",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/form2-sheets%40appproelectricos-53634.iam.gserviceaccount.com"
}
  ''';

  //Obtenemos el spreadsheetId del link del documento que creamos en Google Sheets
  static const sheetId = '1EWqW36chcC8u2SvVmJQiXEgUp5QJmlDvj3NOgXdaZm0';

  static final gsheets = GSheets(credentials);
  static Worksheet? form2Sheet;

  static Future init() async {
    try {
      //Inicializamos el archivo sheets específico que queremos
      final spreadsheet = await gsheets.spreadsheet(sheetId);
      form2Sheet = await _getWorkSheet(spreadsheet, title: 'formulario_2');
      //Declaramos cuáles son los atributos que aparecerán en la primera fila
      final attributes = Form2Fields.getFields();
      //Agregamos los valores de la primera fila (el ! es para validar el null check)
      form2Sheet!.values.insertRow(1, attributes);
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
    if (form2Sheet == null) return;
    try {
      form2Sheet!.values.map.appendRows(rowList, inRange: true);
    } catch (e) {
      print('La data no se pudo agregar.');
    }
  }
}
