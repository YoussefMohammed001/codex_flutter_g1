import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

  double height = 180;
bool isMale  = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
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
                }, color: isMale == true ? Colors.green : Colors.grey.shade700,),



                genderItem(text: 'Female',icon: Icons.female, onTap: () {
                  setState(() {
                    isMale = false;
                  });
                }, color: isMale == false ? Colors.green : Colors.grey.shade700,),
              ],
            ),
          ),
          heightItem(),
          Expanded(
            child: Row(
              children: [
                weightAndAgeItem(title: 'Weight',value:50),
                weightAndAgeItem(title: "Age",value: 20),

              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Text("Calculate",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
          )

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
              Icon(icon,color: Colors.white,),
              Text(text,style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }

Widget heightItem(){
    return   Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height",style: TextStyle(color: Colors.white),),
            SizedBox(height: 10,),
            Text(height.toString(),style: TextStyle(color: Colors.white),),
            Slider(
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



Widget weightAndAgeItem({required String title,required int value }){
    return       Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
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
                    child: IconButton(onPressed: (){},
                      icon: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:Colors.grey
                    ),
                    child: IconButton(onPressed: (){},
                      icon: Icon(Icons.remove,color: Colors.white,),
                    ),
                  ),

                ],)

            ]
        ),
      ),
    );
}


}


