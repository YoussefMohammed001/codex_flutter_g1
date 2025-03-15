import 'package:codex_flutter_g1/main_screen.dart';
import 'package:codex_flutter_g1/reusable_widgets/app_image_asset.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 20,
            children: [
              Text("Login Screen",
              style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.w500,
              ),
              ),
              ImageAsset(image: 'alwaha-logo',),
              SizedBox(width: 30,),
              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return "Please enter your email";
                  }
                  return null;

                },
                decoration: InputDecoration(
                  labelText: "Email",
                  helperText: "example: email@eample.com",
                  border: OutlineInputBorder()
                ),
              ),
              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return "Please enter your password";
                  }
                  return null;

                },
                decoration: InputDecoration(
                  labelText: "Password",

                  border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainScreen()));
                }
              }, child: Text("Login")),
      
            ],
          ),
        ),
      ),
    );
  }
}
