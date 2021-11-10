import 'package:flutter/material.dart';
import 'package:p1/domain/controller/controller_tabla_form2.dart';
import 'package:get/get.dart';

class TablaPeligroForm1 extends StatelessWidget {
  static ControllerTablaForm1 C = Get.find<ControllerTablaForm1>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Riesgo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Si',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'No',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('ELECTRICO:Supervisión de trabajos eléctricos.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[0].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 0);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[0].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 0);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Autorización y/o orden de trabajo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[1].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 1);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[1].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 1);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar botas dieléctricas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[2].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 2);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[2].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 2);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Casco dieléctrico.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[3].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 3);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[3].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 3);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mantiene las distancias de seguridad correctas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[4].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 4);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[4].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 4);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'MECANICOS: Mecanismos en movimientos, Ele. cortanas, Proy. de particulas')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[5].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 5);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[5].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 5);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar guantes de vaqueta, nitrilo o carnaza.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[6].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 6);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[6].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 6);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dotación (camisa manga larga y pantalón).')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[7].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 7);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[7].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 7);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar casco con barbuquejo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[8].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 8);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[8].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 8);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Protección visual gafas con filtro UV')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[9].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 9);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[9].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 9);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar botas dielectricas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[10].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 10);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[10].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 10);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Herramientas en buen estado.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[11].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 11);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[11].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 11);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Barandas o cintas antideslizantes.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[12].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 12);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[12].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 12);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('TRABAJO EN ALTURAS.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[13].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 13);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[13].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 13);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar puntos de anclaje portatíl (Tie off).')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[14].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 14);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[14].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 14);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar linea de vida.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[15].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 15);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[15].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 15);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar casco con barbuquejo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[16].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 16);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[16].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 16);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Eslinga para protección de caidas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[17].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 17);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[17].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 17);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Eslinga de posicionamiento.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[18].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 18);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[18].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 18);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Arnés de seguridad.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[19].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 19);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[19].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 19);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Verificación del sistema de acceso.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[20].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 20);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[20].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 20);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Aplicación de Procedimiento de trabajo seguros.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[21].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 21);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[21].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 21);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('QUIMICO: Gases, vapores, particulas, liquidos.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[22].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 22);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[22].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 22);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Protección respiratoria.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[23].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 23);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[23].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 23);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar gafas con filtro UV.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[24].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 24);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[24].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 24);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Kit de derrames.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[25].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 25);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[25].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 25);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('PSICOSOCIAL.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[26].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 26);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[26].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 26);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('manejo de estres.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[27].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 27);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[27].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 27);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Comunicación efectiva.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[28].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 28);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[28].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 28);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('PUBLICO.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[29].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 29);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[29].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 29);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('Sistema de monitoreo - Acompañamiento policiaco.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[30].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 30);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[30].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 30);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Comunicación y plantificación.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[31].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 31);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[31].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 31);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('TRANSITO.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[32].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 32);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[32].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 32);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'Señalización con vallas, conos, tubulares, cinta, etc.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[33].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 33);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[33].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 33);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Protección completa de la zona de trabajo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[34].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 34);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[34].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 34);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'BIOLOGICO: Virus, hongos, bacterias, animales, COVID-19')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[35].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 35);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[35].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 35);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar botas de caucho caña alta')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[36].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 36);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[36].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 36);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Higienización de vahículo y herramientas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[37].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 37);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[37].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 37);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar protector respiratorio y gafas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[38].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 38);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[38].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 38);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dotación camisa manga larga.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[39].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 39);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[39].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 39);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Lavado de manos con agua y jabon.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[40].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 40);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[40].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 40);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'FISICO: Temperaturas extremas, ilumionación, ruido, radiaciones.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[41].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 41);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[41].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 41);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Hidratación.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[42].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 42);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[42].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 42);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Uso de protector solar.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[43].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 43);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[43].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 43);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar linterna.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[44].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 44);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[44].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 44);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Uso de iluminación preventiva en vehículos.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[45].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 45);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[45].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 45);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar protección auditiva.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[46].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 46);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[46].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 46);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dotación de uniforme camisas manga larga.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[47].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 47);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[47].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 47);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar gafas con filtro UV.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[48].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 48);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[48].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 48);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'LOCATIVOS: Defectos del piso (lisos, irregulares, humedos o fangosos).')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[49].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 49);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[49].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 49);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Señalización y demarcación de area.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[50].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 50);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[50].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 50);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Caminar con precaución.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[51].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 51);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[51].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 51);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Verificación del area de trabajo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[52].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 52);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[52].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 52);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar botas de seguridad.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[53].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 53);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[53].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 53);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Usar botas de caña alta.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[54].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 54);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[54].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 54);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('BIOMECANICOS')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[55].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 55);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[55].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 55);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Hacer calentamiento previo.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[56].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 56);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[56].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 56);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Levantar correctamente las cargas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[57].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 57);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[57].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 57);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Realización de pausas activas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[58].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 58);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[58].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 58);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Align(
//         child:TablaPeligro(),
//         alignment:Alignment.center,)
//     );
//   }
// }

