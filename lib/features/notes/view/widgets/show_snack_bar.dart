import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String title, required Color color, required VoidCallback onPressed}){
  final snackBar = SnackBar(content: Text(title,
    style: TextStyle(color: Colors.white),
  ),
    backgroundColor: color,
    action: SnackBarAction(
      label: 'Undo', onPressed:onPressed,

    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar,);
}