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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              print("pressed");
              counter--;
              setState(() {
              });
            },
          ),
          SizedBox(
          width:30,
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print("pressed");
              setState(() {
                counter++;
              });
            },
          ),
          SizedBox(
            width:30,
          ),
          FloatingActionButton(
            child: Icon(Icons.restart_alt),
            onPressed: () {
              print("pressed");
              counter++;
              setState(() {

              });
            },
          ),
        ],
      ),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Home Screen",
        style:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ) ,)),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
                children: [
        Text("Home Screen",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        ),
        Text(counter.toString()),
                ],
              ),
      ),
    );
  }
}

