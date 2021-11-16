import 'package:flutter/material.dart';
import 'package:p1/ui/widgetReutilizables/boton_widget.dart';
import 'package:p1/ui/widgets/menu_general/menu/menu.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({
    // Receives Value to display in cell, and it's respective pos in matrix
    Key? key,
    required this.jobName,
    required this.jobNumber,
  }) : super(key: key);

  final String jobName;
  final int jobNumber;

  @override
  Widget build(BuildContext context) {
    return BotonWidget(
      text: jobName,
      icon: const Icon(Icons.check_box, size: 20.0, color: Color(0xff264F95)),
      press: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => MenuOptionsScreen(
                  jobNumber: jobNumber,
                )))
      },
    );
  }
}
