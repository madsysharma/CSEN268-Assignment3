import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  //An app bar that is customizable based on which screen it is in
  final String text;
  final String screen;
  const CustomAppBar({super.key, required this.text, required this.screen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(240, 214, 244, 0.852),
      centerTitle: true,
      title: Text(text, textAlign: TextAlign.center),
      leading: (this.screen=="Book List"? IconButton(onPressed: (){}, icon: Icon(Icons.menu)) : IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}