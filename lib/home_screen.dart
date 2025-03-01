import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int counter = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold => appBar, body,bottom navigation bar,floating, drawer
    // Column => vertical list of widgets
    // Row => horizontal list of widgets
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Expanded Containers",
        style:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ) ,)),
      body: Center(
        child: Column(
                children: [
              Expanded(
                child: Row(
                  children: [
                    containerItem(text: "1",color: Colors.red,),
                    containerItem(text: "2",color: Colors.yellow,),
                    containerItem(text: "3",color: Colors.yellow,),
                  ],
                ),
              ),

                  Expanded(
                    child: Row(
                      children: [
                        containerItem(text: "4",color: Colors.green,),
                        containerItem(text: "5",color: Colors.blue,),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
  Widget containerItem({required String text,required Color color}) {
    return   Expanded(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text)),
    );
  }






}


