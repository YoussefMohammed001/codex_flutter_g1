import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // to create full  screen use  >>>>Scaffold widget<<<<
    return Center(
      child: Text(
        "Hello Flutter",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
          fontSize: 40,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
