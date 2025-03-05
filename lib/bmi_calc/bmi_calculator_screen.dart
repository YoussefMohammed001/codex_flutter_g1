import 'dart:math';
import 'package:codex_flutter_g1/bmi_calc/app_colors.dart';
import 'package:codex_flutter_g1/bmi_calc/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

double height = 170;
bool isMale  = true;
int weight = 70;
int age = 23;







  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:background ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("BMI Calculator",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                genderItem(text: 'Male', icon: Icons.male, onTap: () {
                  setState(() {
                    isMale = true;
                  });
                }, color: isMale == true ?selectedCardColor : cardColor,),
                genderItem(text: 'Female',icon: Icons.female, onTap: () {
                  setState(() {
                    isMale = false;
                  });
                }, color: isMale == false ? selectedCardColor :cardColor,),
              ],
            ),
          ),
          heightWidget(),
          Expanded(
            child: Row(
              children: [
                weightAndAgeWidget(title: 'Weight',value:weight,),
                weightAndAgeWidget(title: "Age",value: age,),

              ],
            ),
          ),
          calculateButton()

        ],
      ),
    );
  }



Widget genderItem({required String text,required IconData icon,required GestureTapCallback onTap,required Color color}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,size: 60,),
              Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }


Widget heightWidget(){
    return   Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(height.toInt().toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
            Slider(
              activeColor: primaryPink,
              value: height,
              max: 230,
              min: 100,
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
                print(value);
              },
            ),
          ],
        ),

      ),
    );
}

Widget weightAndAgeWidget({required String title,required int value}){
    return       Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text(value.toString(),style: TextStyle(color: Colors.white),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:Colors.grey
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          if(title == "Age"){
                            age++;
                          }else{
                            weight++;
                          }
                        });
                      },
                      icon: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          if(title == "Age"){

                            if(age>1){
                              age--;
                            }

                          }else{
                            if(weight >3){
                              weight--;
                            }
                          }
                        });
                      },
                      icon: Icon(Icons.remove,color: Colors.white,),
                    ),
                  ),

                ],),
            ]
        ),
      ),
    );
}


Widget calculateButton(){
    return           InkWell(
      onTap: (){

        final double _bmi = weight / pow(height / 100, 2);
        print(_bmi);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BmiResultScreen(result: _bmi,);
        }));

      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: primaryPink,
        ),
        child: Text("Calculate",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),),
      ),
    );
}

}


