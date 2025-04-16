import 'package:codex_flutter_g1/features/login/model/login_request_model.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_cubit.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_state.dart';
import 'package:codex_flutter_g1/features/main_screen/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginError){
      print("listener: ${state.message}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.message,
      )));
    }else if(state is LoginSuccess){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      print("listener: ${state.message}");

      // TODO: push main screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
        return MainScreen();
      }

      ));

    }
  },
  child: Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(height: 100,),
                Center(child: Text("Login Now,to continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (v){
                    if(v!.isEmpty){
                      return "Enter Email";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  validator: (v){
                    if(v!.isEmpty){
                      return "Enter Password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,

                  child: TextButton(onPressed: (){

                  }, child: Text("Forget Password?",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return state is LoginLoading ? Center(child: CircularProgressIndicator(),) : ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      context.read<LoginCubit>().login(loginRequestModel: LoginRequestModel(email: emailController.text, password: passwordController.text));
                      print("email: ${emailController.text}\npassword: ${passwordController.text}");
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size(
                        double.infinity,
                        50
                      ),
                    ),
                    shape: WidgetStatePropertyAll(

                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStatePropertyAll(Colors.green),

                  ), child: Text("Login",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                  );
  },
),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){}, child: Text("Sign Up",style: TextStyle(color: Colors.green),))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
