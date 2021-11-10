import 'package:flutter/material.dart';
//Esta clase es para que si la tabla no cabe en la interfaz del celulalar se
//pueda hacer scroll horizontal y vertical

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}
