import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/comp_textformfield.dart';

class Parte1Form1 extends StatefulWidget {
  Parte1Form1(
      {Key? key,
      required this.empresa,
      required this.municipio,
      required this.pickedDate,
      required this.cliente,
      required this.jornada,
      required this.vehiculo,
      required this.distrito,
      required this.direccion,
      required this.no,
      required this.horaInicio,
      required this.horaFin,
      required this.descargo,
      required this.incidencia,
      required this.nic,
      required this.aviso,
      required this.numero,
      required this.circuito,
      required this.mt,
      required this.ct,
      required this.tension,
      required this.supervisor,
      required this.celSupervisor,
      required this.agenteDescargo,
      required this.celAgenteDescargo})
      : super(key: key);

  final TextEditingController empresa;
  final TextEditingController municipio;
  DateTime pickedDate;
  final TextEditingController cliente;
  final TextEditingController jornada;
  final TextEditingController vehiculo;
  final TextEditingController distrito;
  final TextEditingController direccion;
  final TextEditingController no;
  final TextEditingController horaInicio;
  final TextEditingController horaFin;
  final TextEditingController descargo;
  final TextEditingController incidencia;
  final TextEditingController nic;
  final TextEditingController aviso;
  final TextEditingController numero;
  final TextEditingController circuito;
  final TextEditingController mt;
  final TextEditingController ct;
  final TextEditingController tension;
  final TextEditingController supervisor;
  final TextEditingController celSupervisor;
  final TextEditingController agenteDescargo;
  final TextEditingController celAgenteDescargo;

  @override
  Parte1Form1State createState() {
    return Parte1Form1State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form1State extends State<Parte1Form1> {
  late TextEditingController empresa = widget.empresa;
  late TextEditingController municipio = widget.municipio;
  late DateTime pickedDate = widget.pickedDate;
  late TextEditingController cliente = widget.cliente;
  late TextEditingController jornada = widget.jornada;
  late TextEditingController vehiculo = widget.vehiculo;
  late TextEditingController distrito = widget.distrito;
  late TextEditingController direccion = widget.direccion;
  late TextEditingController no = widget.no;
  late TextEditingController horaInicio = widget.horaInicio;
  late TextEditingController horaFin = widget.horaFin;
  late TextEditingController descargo = widget.descargo;
  late TextEditingController incidencia = widget.incidencia;
  late TextEditingController nic = widget.nic;
  late TextEditingController aviso = widget.aviso;
  late TextEditingController numero = widget.numero;
  late TextEditingController circuito = widget.circuito;
  late TextEditingController mt = widget.mt;
  late TextEditingController ct = widget.ct;
  late TextEditingController tension = widget.tension;
  late TextEditingController supervisor = widget.supervisor;
  late TextEditingController celSupervisor = widget.celSupervisor;
  late TextEditingController agenteDescargo = widget.agenteDescargo;
  late TextEditingController celAgenteDescargo = widget.celAgenteDescargo;

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        ListTile(
          title: Text(
            "Fecha: ${pickedDate.day}/ ${pickedDate.month}/ ${pickedDate.year}",
            style: const TextStyle(fontSize: 15),
          ),
          trailing: const Icon(Icons.keyboard_arrow_down),
          onTap: _pickDate,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Nombre empresa',
          cont: empresa,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Municipio',
          cont: municipio,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Cliente',
          cont: cliente,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Jornada de trabajo',
          cont: jornada,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Vehículo',
          cont: vehiculo,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Distrito',
          cont: distrito,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Dirección',
          cont: direccion,
        ),
        CompTextFormField(
          casoVacio: 'No',
          hintText: '',
          labelText: 'No.',
          cont: no,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Hora de inicio',
          cont: horaInicio,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Hora finalización',
          cont: horaFin,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Descargo',
          cont: descargo,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Incidencia',
          cont: incidencia,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'NIC',
          cont: nic,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Aviso',
          cont: aviso,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Número',
          cont: numero,
        ),
        CompTextFormField(
            casoVacio: 'Rellene todos los campos',
            hintText: '',
            labelText: 'Circuito',
            cont: circuito),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'MT',
          cont: mt,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'CT',
          cont: ct,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Nivel de tensión',
          cont: tension,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Ingeniero supervisor',
          cont: supervisor,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Celular',
          cont: celSupervisor,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Agente de descargo',
          cont: agenteDescargo,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Celular',
          cont: celAgenteDescargo,
        ),
      ],
    );
  }
}
