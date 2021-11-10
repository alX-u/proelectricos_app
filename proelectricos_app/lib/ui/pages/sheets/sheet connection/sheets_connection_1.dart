//Importamos el paquete de google sheets
import 'package:flutter/cupertino.dart';
import 'package:gsheets/gsheets.dart';
import 'package:p1/ui/pages/sheets/form_1_sheet.dart';

//Creamos la clase con la que manejaremos el CSV
class FormSheets {
  //Extraemos las credenciales con ayuda de Google.Cloud (ver: https://www.youtube.com/watch?v=3UJ6RnWTGIY&t=25s min 1:24-3:10)
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "appproelectricos-53634",
  "private_key_id": "0300646f1861ce83434fe8c1c57bf188be2904a0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDSYEZSTfGsz7yV\nGsPdIkacKavFtK+HR6nihapBCz38jH6XeaYt2P2rklu6XF72jDSH+IsXjXAa8eKJ\nJytO9/sKJby3e/1Ike7409KkVe66E0HQVlk5ELc/IabfXMT8IfSm62rnHkGM5JWl\nhAOW/rU9R0c5bCarju5/14hLUFwb9tdRIWhzee26a+Sq6i6MnSuSDCshZW541xQ1\nPArcc8jDJZ+IwlvBYgSO975mg8wNBNsUa6qSwcFsr82LnmtzDctYM2l3MJkCsW0H\n84ZwQnERqpOMRXGQITOu0Ch8UUsXUnYwxMhC2U8RZalZxVzO8n+yY8c8DHtMBG8t\nZkkZllNjAgMBAAECggEACuE4vpi4vWx9S70qt1zgIVzHieRHMAW+qiNDtugICIlG\nVYe28BsPPDH7Aj9oF9pDYzhkdRwQjQwvLSAN9AamGhQk8Nyw/Vfl76kAwhTBnltQ\ny+xgFXy6uI40ef7rUkDG5sg5BJypD8piJNrko28m9cIIbTzqUqgD+vxgcfveos5N\nG5aqAVcixsFui4YebdkXKkXAnImGTT4zFSUu5v8QgPh9ESOvC9AHjG8EoJ3HjO54\nU1rVgeN+evh1I1dlt9YMzlpcS9EBmucIhpgDVSBTayDkfvnFawOxx7BreoRbEKXG\n9DR6vhh1tGExsasE4joiRRj34NZg7tTqmO2rgn9nKQKBgQDylxuRRbhLckCBo2IO\nlMOuwGOS+cUQ9QF72huFKRkmH4ZnHbsiCko8+YIfkMjAmjOphwLnAY1PEZVzJN4V\nypmAiz2nFyM/am9nNcxJYZ/wSyieln7ktVJ8pi0yKL7WypplgCd0Qi2xd5oCp8D8\naOr1eistM07JK6BoIxbDUsGYCQKBgQDeAU3n6o9na60mhESI9buyY5HSngE1kZLQ\nxly1wWfM7UA+a7Y0HGuw2+z0w8yCm07nh4F1SMjsBISYdVlTzhJPIswAZ1c9uvwK\nVe5DSwpsg4Cl+KX1bfr0Uk2CCO3PtzFqHQXaYChTgjT/U8hY9nXHYgZrkQirwidM\nN2uzWuMzCwKBgQC68NUumsKNaUrqW8Rpphwxo1JYZZ+GFLgDAC2q7OPTbAG/nrqh\nXbqdyEyNFJ6PRYVAQ6lp6NlDMDKx25xEwK6Pzz1AcOUZrmSQ7XUyq0d7/f8cTq8U\ngeJB6jDz8VA250QZqas9vO3HT3pgR3PBTvyZFH8HQv2YqsTe2wNkm3ZSOQKBgQC6\n4IAy69jhJtuvY4HJhIkGZhh3IbhE3pCmm4OpH+//qer9YHAUt6PTUZ3KgBNkEdY+\nwWsxTh6LxlXTfFzAVeRFpzXwVQ00EnVdQe55yO4yYBPoIkGZMoYgKjPCdT+yLTQ0\nbc/ifjUT7rQsBdvNP1Hvj012OLUC2EF6P+CyLpy39wKBgQCX/OfdbNRm1dgh18Gn\ni6WoT48pTGEwZpouHzQugXvGKC4hUnKEzMFYtsTr/IS9+4ab/P3yUpHwDxHZRFD1\ns86KdmoLyFuuvxIU1wjECgzP/7huZgC0TfY2giQggtD514zMd75xre3VDkxfQOIz\na0YlcphFd3nLmhxIzUTF3lSdmA==\n-----END PRIVATE KEY-----\n",
  "client_email": "form-sheets@appproelectricos-53634.iam.gserviceaccount.com",
  "client_id": "115646575299860919690",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/form-sheets%40appproelectricos-53634.iam.gserviceaccount.com"
  }  
  ''';
  //Obtenemos el spreadsheetId del link del documento que creamos en Google Sheets
  static const sheetId = '1GZgGIlz6wXnUvXG8gWTMjat9pciKvtN1c4WPbnXOID0';
  //Inicializamos el paquete de Google Sheets
  static final gsheets = GSheets(credentials);
  static Worksheet? form1Sheet;
  //Creamos una funcion de inicialización para acceder a los documentos
  static Future init() async {
    try {
      //Inicializamos el archivo sheets específico que queremos
      final spreadsheet = await gsheets.spreadsheet(sheetId);
      form1Sheet = await _getWorkSheet(spreadsheet, title: 'formulario_1');
      //Declaramos cuáles son los atributos que aparecerán en la primera fila
      final attributes = form1Fields.getFields();
      //Agregamos los valores de la primera fila (el ! es para validar el null check)
      form1Sheet!.values.insertRow(1, attributes);
    } catch (e) {
      //Por si ocurre alguún error
      print('Error in initialization');
    }
  }

  //Creamos una función que obtendrá el sheet basado en el título. De no existir esta sheet, la creará.
  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  //Función para enviar info a una fila de Google Sheets
  static Future insertar(List<Map<String, dynamic>> rowList) async {
    if (form1Sheet == null) return;
    try {
      form1Sheet!.values.map.appendRows(rowList, inRange: true);
    } catch (e) {
      print('La data no se pudo agregar.');
    }
  }
}
