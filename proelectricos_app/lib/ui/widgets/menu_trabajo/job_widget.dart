import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/componentes/boton_widget.dart';
import 'package:p1/ui/widgets/menu_general/menu/menu.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({
    // Receives Value to display in cell, and it's respective pos in matrix
    Key? key,
    required this.jobName,
  }) : super(key: key);

  final String jobName;

  @override
  Widget build(BuildContext context) {
    return BotonWidget(
      text: jobName,
      icon: const Icon(Icons.check_box, size: 20.0, color: Color(0xff264F95)),
      press: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const MenuOptionsScreen()))
      },
    );

    /*height: 100,
        margin: const EdgeInsets.only(left: 30, right: 60),
        child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Indicator
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: proElectricosBlue),
                      color: const Color(0xffefefef)),
                  child: IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.check_box,
                          color: proElectricosBlue))),
              // Text("$jobName"),
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.skip_next, color: ProElectricosBlue))
              Expanded(
                  child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Text(jobName)),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:
                                      (context) => //Encargamos al builder que cambie el contexto a la página de menú general
                                          const MenuOptionsScreen()));
                        },
                        icon: const Icon(Icons.skip_next,
                            color: proElectricosBlue),
                      ),
                    ]),
              ))
            ])*/
  }
}
