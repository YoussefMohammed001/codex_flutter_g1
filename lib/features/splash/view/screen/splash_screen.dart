import 'dart:async';
import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
bool isVisible  = false;
double size = 50;
String splashText = "";
String splashFullText = "SOUQ APP";

late AnimationController animationController;
late Animation<Offset> _offsetAnimation;

showIcon(){
  isVisible = true;
}


  checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("id");
    if (userId != null) {
  Navigator.pushReplacementNamed(context, Routes.main);
    } else {
    Navigator.pushReplacementNamed(context, Routes.login);
    }
  }
animatedText() async {
  for(int  letter = 0 ; letter < splashFullText.length; letter++){
    await Future.delayed(Duration(milliseconds: 100));

    setState(() {
      splashText +=    splashFullText[letter];
      //splashText =  splashText + splashFullText[letter];

    });
    print(splashFullText[letter]);
  }

}

  @override
  void initState() {
    animatedText();
    // Timer.periodic(Duration(milliseconds: 300), (timer) {
    //   size = size == 100 ? 50 : 100;
    //   setState(() {
    //   });
    // });

     animationController = AnimationController(
         vsync: this,
       duration: Duration(milliseconds: 600),
     );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 10.0),
      end:  Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      )
    );
    animationController.forward();

  Future.delayed(Duration(milliseconds: 400)).then((onValue){

    setState(() {
      showIcon();
    });
  });





  Future.delayed(Duration(
      seconds: 2
  )).then((onValue) {
    checkLoginStatus();
  });


    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   width: size,
            //   height:size ,
            //   color: Colors.red,
            //   duration:   Duration(milliseconds: 500),
            //     child: Icon(Icons.storefront_outlined, size: 50,
            //       color: AppColors.primaryColor,
            //     ),
            // ),
            AnimatedOpacity(
              opacity: isVisible ? 1 : 0,
              duration: Duration(milliseconds: 800),
              child: Icon(Icons.storefront_outlined, size: 100,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20,),
            Text(splashText,
              style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 25
              ),
            ),


            SlideTransition(
                position: _offsetAnimation,
                child: Text("Enjoy our products",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
                )),
          ],
        ),
      ),
    );
  }
}
