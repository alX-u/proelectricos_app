import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/ui/widgetReutilizables/scrollable_widget.dart';

class TablasForm extends StatefulWidget {
  const TablasForm(
      {Key? key,
      required this.titleColumns,
      required this.titleRows,
      required this.valorsw})
      : super(key: key);

  final List<String> titleColumns;
  final List<String> titleRows;
  final RxList<RxBool> valorsw;

  @override
  TablasFormState createState() {
    return TablasFormState();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class TablasFormState extends State<TablasForm> {
  //Le pasamos por parámetro los titulos de las filas y de las columnas y el vector con los valores de los sw
  late List<String> titleColumns = widget.titleColumns;
  late List<String> titleRows = widget.titleRows;
  late RxList<RxBool> valorsw = widget.valorsw;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return ScrollableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    return DataTable(
      headingRowColor:
          MaterialStateColor.resolveWith((states) => proElectricosBlue),
      //Espacio vertical entre campos
      dataRowHeight: 90,
      columns: getColumns(titleColumns),
      rows: getRows(titleRows),
    );
  }

  //Para obtener las colums de la lista
  List<DataColumn> getColumns(List<String> titleColumns) => titleColumns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: const TextStyle(color: Colors.white),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<String> titleRows) => titleRows
      .map((String campo) => DataRow(
            cells: [
              DataCell(Container(
                //Espacio horizontal entre 2 campos
                width: 150,
                child: Text(campo),
              )),
              DataCell(
                Switch(
                  value: valorsw[titleRows.indexOf(campo)].value,
                  onChanged: (value) {
                    setState(() {
                      //C.cambiarvalor(value, titleRows.indexOf(campo));
                      valorsw[titleRows.indexOf(campo)].value = value;
                      print(valorsw[titleRows.indexOf(campo)].value);
                    });
                  },
                  activeColor: proElectricosBlue,
                  inactiveThumbColor: Colors.orangeAccent,
                  inactiveTrackColor: Colors.yellow,
                ),
              ),
              /*DataCell(
                    Obx(
                      () => Checkbox(
                        value: C.si[campos.indexOf(campo)].value,
                        onChanged: (bool? val) {
                          C.cambiarvalorsi(val!, campos.indexOf(campo));
                        },
                      ),
                    ),
                  ),*/
              /*DataCell(
                    Obx(
                      () => Checkbox(
                        value: C.no[campos.indexOf(campo)].value,
                        onChanged: (bool? val) {
                          C.cambiarvalorno(val!, campos.indexOf(campo));
                        },
                      ),
                    ),
                  ),*/
            ],
          ))
      .toList();
}
