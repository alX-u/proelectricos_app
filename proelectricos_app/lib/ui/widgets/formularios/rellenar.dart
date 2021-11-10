import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RellenarForm extends StatelessWidget {
  final _claveFormulario = GlobalKey<FormState>();
  final TextEditingController _certificado = TextEditingController();
  final TextEditingController _dielectricas = TextEditingController();
  final TextEditingController _placa = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Form(
          key: _claveFormulario,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(""),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Placa del vehículo",
                  hintText: 'Escribe la placa',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe la placa';
                  }
                    return null;
                },
                controller: _placa,
              ),
              Container(
                child: Text(""),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe las pruebas';
                  }
                  return null;
                },
                controller: _dielectricas,
                decoration: InputDecoration(
                  hintText: 'Escribe las pruebas dieléctricas',
                  labelText: "Certificado de pruebas dieléctricas vigentes",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
              ),
              Container(
                child: Text(""),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe el certificado';
                  }
                  return null;
                },
                controller: _certificado,
                decoration: InputDecoration(
                  hintText: 'Escribe el certificado de izaje',
                  labelText: "Certificado de izaje vigente",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
                
              ),
              Container(
                child: Text(""),
              ),
            ],
          ),
         
  
      ), 
         
    );
  }
}

class RellenarForm2 extends StatelessWidget {
  final _claveFormulario2 = GlobalKey<FormState>();
  final TextEditingController _kilometraje = TextEditingController();
  final TextEditingController _horometraje = TextEditingController();
  final TextEditingController _observaciones = TextEditingController();
  final TextEditingController _diligenciador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  
      child:Form(
        key: _claveFormulario2,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(""),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Escribe número de kilometraje',
                  labelText: "Número de Kilometraje",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe número de Kilometraje';
                  }
                    return null;
                },
                controller: _kilometraje,
              ),
              Container(
                child: Text(""),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Escribe número de horometraje',
                  labelText: "Número de horometraje",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe número de horometraje';
                  }
                    return null;
                },
                controller: _horometraje,
              ),
              Container(
                child: Text(""),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe observaciones';
                  }
                  return null;
                },
                controller: _observaciones,
                decoration: InputDecoration(
                  hintText: 'Escribe observaciones',
                  labelText: "Observaciones",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
              ),
              Container(
                child: Text(""),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Escribe cargo del diligenciador';
                  }
                  return null;
                },
                controller: _diligenciador,
                decoration: InputDecoration(
                  hintText: 'Escribe el cargo del diligenciador',
                  labelText: "Cargo de quien diligencia",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)), 
                    borderSide: BorderSide(color: Color(0xff264F95))
                  ),
                ),
                
              ),
              Container(
                child: Text(""),
              ),
            ],
          ),
      ),    
    );
  }
}

