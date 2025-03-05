import 'package:codex_flutter_g1/bmi_calc/app_colors.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
 const  BmiResultScreen({super.key, required this.result });
final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(
          color: whiteColor
        ) ,
        title: Text("BMI Result",style: TextStyle(color: whiteColor),),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Text("result is ${result.toStringAsFixed(2)}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
              color: whiteColor),),
            ),

            calculateButton(context),

        ],),
      ),
    );
  }



 Widget calculateButton(BuildContext context){
   return        InkWell(
     onTap: (){
       Navigator.pop(context);
     },
     child: Container(
       alignment: Alignment.center,
       width: double.infinity,
       padding: EdgeInsets.all(25),
       decoration: BoxDecoration(
         color: primaryPink,
       ),
       child: Text("Re-Calculate",style: TextStyle(color: Colors.white,
           fontWeight: FontWeight.bold,
           fontSize: 25
       ),),
     ),
   );
 }
}

