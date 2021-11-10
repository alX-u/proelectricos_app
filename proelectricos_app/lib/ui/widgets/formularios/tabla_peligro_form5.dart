import 'package:flutter/material.dart';
import 'package:p1/domain/controller/controller_tabla_form5.dart';
import 'package:get/get.dart';

class TablaPeligroForm2 extends StatelessWidget {
  static ControllerTablaForm2 C = Get.find<ControllerTablaForm2>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Condicion inspeccionar',
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
              DataCell(Text('LLANTAS: Espárragos')),
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
              DataCell(Text('Labrado')),
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
              DataCell(Text('Presión de aire')),
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
              DataCell(Text('Repuesto')),
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
              DataCell(Text('Tuercas')),
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
                  'ORDEN Y ASEO: Cabina limpia y en orden')),
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
              DataCell(Text('Exterior del vehículo limpio y en orden')),
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
              DataCell(Text('Kit antiderramante')),
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
              DataCell(Text('Vidrios y espejos limpios y completos')),
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
              DataCell(Text('FLUIDOS (NIVELES Y FUGAS): Filtro depurador')),
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
              DataCell(Text('Nivel de aceite de la transmisión.')),
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
              DataCell(Text('Nivel de aceite hidráulico')),
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
              DataCell(Text('Nivel de aceite motor')),
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
              DataCell(Text('Nivel de combustible')),
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
              DataCell(Text('Nivel de líquido refrigerante')),
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
              DataCell(Text('EQUIPO DE CARRETERA Y DE SEGURIDAD: Botiquín')),
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
              DataCell(Text('Chaleco reflectivo disponible')),
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
              DataCell(Text('Cinturones de seguridad')),
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
              DataCell(Text('Conos o triángulos y tacos disponibles')),
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
              DataCell(Text('Cruceta disponible')),
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
              DataCell(Text('Extintor disponible')),
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
              DataCell(Text('Guantes disponibles')),
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
              DataCell(Text('Herramientas')),
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
              DataCell(Text('El vehículo cuenta con cintas reflectivas (blanco y rojo)')),
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
              DataCell(Text('Linterna disponible y funcionable')),
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
              DataCell(Text('SISTEMA HIDRÁULICO: Balero de rotación')),
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
              DataCell(Text('Cilindros de estabilizadores libre de fuga')),
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
              DataCell(Text('Cilindros de extensiones del brazo libres de fuga')),
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
                    value: C.no[22].value,
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
              DataCell(Text('Cilindros principal y auxiliar del brazo libres de fuga')),
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
              DataCell(Text('Estabilizadores y zapatas')),
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
                  Text('Estado de las extensiones')),
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
              DataCell(Text('Estado del boom principal o articulaciones principales y sus pasadores')),
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
              DataCell(Text('Mandos de operación funcionables y libres de fuga')),
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
                  'Mangueras y conexiones libres de fugas')),
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
              DataCell(Text('SISTEMA DE IZAJE: Equipo de barrena, malacate, canasta, pistola, guía de poste o winche')),
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
                  'Eslingas, guayas, cadena, manila en buen estado')),
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
              DataCell(Text('Grillete, estrobos, gancho en buen estado')),
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
              DataCell(Text('Indicador de ángulo disponible y funcionable')),
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
              DataCell(Text('SISTEMA DE FRENOS: Freno de motor')),
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
              DataCell(Text('Freno de parqueo')),
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
              DataCell(Text('Freno de servicio')),
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
                  'Mangueras, tanques y tuberías')),
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
              DataCell(Text('Presión de aire sistema de frenos')),
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
              DataCell(Text('Max: 800 KPa o 120 PSI (Cargue sistema y registre presión máxima)')),
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
              DataCell(Text('Activación de alarma de baja presión de aire')),
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
              DataCell(Text('Debajo de 500 KPa o 65 PSI (Descargue y registre la presión)')),
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
              DataCell(Text('Activación automática de freno de parqueo')),
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
              DataCell(Text('Debajo de 400 KPa o 45 PSI (Descargue y registre la presión)')),
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
              DataCell(Text('SISTEMA ELECTRICO (LUCES Y CONTROLES): Direccionales')),
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
                  'Exploradoras')),
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
              DataCell(Text('Lámparas medias y altas')),
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
              DataCell(Text('Limpia parabrisas')),
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
              DataCell(Text('Parqueo')),
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
              DataCell(Text('Reversa y alarma')),
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
              DataCell(Text('SISTEMA MECÁNICO: Caja de cambio')),
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
              DataCell(Text('Control del toma fuerza')),
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
              DataCell(Text('Correas')),
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
              DataCell(Text('Transmisión')),
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
              DataCell(Text('OTROS: Dirección')),
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
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Estado general de la carrocería')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[59].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 59);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[59].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 59);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Suspensión')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[60].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 60);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[60].value,
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 60);
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