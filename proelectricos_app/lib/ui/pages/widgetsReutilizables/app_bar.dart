import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/account.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.text,
    required this.backgroundColor,
    this.height = kToolbarHeight,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        //Te regresa a la ruta inmediatamente anterior
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
          )),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const EditProfilePage()));
          },
        ),
      ],
    );
  }
}
