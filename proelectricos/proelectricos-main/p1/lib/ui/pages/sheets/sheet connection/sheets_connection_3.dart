import 'package:gsheets/gsheets.dart';
import 'package:p1/ui/pages/sheets/form_3_sheet.dart';

class FormSheets3 {
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "appproelectricos-53634",
  "private_key_id": "81b9ef11d0e6e2debc9a3be6e540adb589018929",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC8A6ipRGzFZk0H\nKgBvRSgul0Uubn0qaekErNhuGxbWc1/JN+qwEDWrSPQBoEiUZpTpwoDuy5gZcTuM\nYzHGl/vCwYgfmiWDJBsSRky3yo42GyE4EQhKgUnRSsxYX9wCcatHg74CiQE/S4lK\n46+po8FLssT6/F4uDayienWh2i7ZqQJk6uD/ax7LFxhWOY/N+K1OIe83JifsHq85\nkKjjxcqURWEZuJKTAKduTel8N9picyM7XEhd/yqp7MNCfpW+3KeFMsxOuBIarSFc\ndbTkPbmJBJvAZEsgHlSWdR3uIJ6fAItelj4oEirrmKmHUX/wzGUXJFX89kW05PZk\nxzcV2lF9AgMBAAECggEAS/PCb9bXhgsktO8vy8OJTwEHDpHN+JNecegNarWAzVNA\nb74qDcQOmkpXYEzK5UBnieNsSItwv15x6u2rjwmYx/18qx+PZeHxGbnShjDKsGrX\nSZn/2nFOS8FGubDH5SjcQ4CiAs4r9dDi/qDqNsKTdKwcTTQkK8CUa/LCkIbehEjD\noKP6aWJOwvBTDQsVi5aQ2qxu4xmCPgxlkK8ZXCwCg/XxSM9RJDF9mS85XSxv9v8v\n+t53KPsdPPo/8YmDwA/hlEwtpTFoOXD/OSNxLxhF8ZFxzWFOxCssjWMp68DS9u2N\nkzL7H0zyBMkgmdGhz4zF561S3V9/fbyyM7+FvERkdQKBgQDrU19YsFjpgN8GDEd1\nOtk8iMW8iUQQbJMjTPokJ1iMoP2nzU7uamXGEgQbArU35D/oo+/vAnrQhX8sRRsd\noXdbGVJ3U0ETt9PO3ByEuPSdFYYySbW3D9ZrfAh4dsw3qHiGRW7Ho/riIW8cfeo/\nOIFzAnaC52bTgzVJGUpwBEOhqwKBgQDMiDj+PA3OoF+Zt1/HfOQ9U67HnQaA+jdC\n48DXatT4QLp6pHx/SyXkHBqYQQDvuBSMOwRm0qIGk91F9iHKiq8XBlHkID9BMbTV\nM+KeHaMzlQYcMkJu6x8gl08JDZifjSNxTWcav+zXgSMHqnTNqSeDHnFnfqAoAeXT\no8q89NmBdwKBgQCuqfQT/NgRgFCIyaZkMai50H6LwIpfcmcHhYQIP5fu0TNUUAOs\n3BXsHMUlUy40bNqujrdwfDOx/9PzhNtqc8UGPdZCsO2VeBTi7ebQ8ALHcQlo2+Lf\nHAc3Qhl7aBmNmiLS7kgaL/Dv1IcG68Jo6ETUm1hhMuXUSgfL2NSyLcgQ/wKBgQDH\nE6xNoMxbmvOSXc8HD4PkQUh0mF1VOraBD8eKpTxHqlEXwHRBPjbSUZx9J4Au1ACE\nAYmmP0xflJqiVxDK4LPNeGRK5CxNW4FEp6zi87v/IAUDetP4vDfe9AeEq0wruCeQ\nR6OcgMSZeeNLudjYuNVxpTcCYlimuDooBlv2EWiHvwKBgQCGd3SCiFbZHKCEDmI8\nBhzpr1//w1aC2XWFN2ZY6q9fUXrtdCi3lpA4PDqy5DUbWrTU4PNflT7SWlVW1aon\nZnpF//K7dbs80wt2N4x97a54VgNO7JSqy4Y7fagWKjZ6XNLZUXy3dK6lKbYs7dEs\nx34Y9/gDxlxwTp4YU43T2W3D/A==\n-----END PRIVATE KEY-----\n",
  "client_email": "form3-sheets@appproelectricos-53634.iam.gserviceaccount.com",
  "client_id": "100697215531444248535",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/form3-sheets%40appproelectricos-53634.iam.gserviceaccount.com"
  } 
  ''';

  //Obtenemos el spreadsheetId del link del documento que creamos en Google Sheets
  static const sheetId = '1vKomiyJ4zfth_b9Z9OsPLEYnwdVJA7nPB2ZPHXOD1RY';

  static final gsheets = GSheets(credentials);
  static Worksheet? form3Sheet;

   static Future init() async {
    try {
      //Inicializamos el archivo sheets específico que queremos
      final spreadsheet = await gsheets.spreadsheet(sheetId);
      form3Sheet = await _getWorkSheet(spreadsheet, title: 'formulario_3');
      //Declaramos cuáles son los atributos que aparecerán en la primera fila
      final attributes = form3Fields.getFields();
      //Agregamos los valores de la primera fila (el ! es para validar el null check)
      form3Sheet!.values.insertRow(1, attributes);
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
    if (form3Sheet == null) return;
    try {
      form3Sheet!.values.map.appendRows(rowList, inRange: true);
    } catch (e) {
      print('La data no se pudo agregar.');
    }
  }

}
