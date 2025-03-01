import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
bool obscure = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration:  InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                 labelText: "Email",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              obscureText: obscure,
              decoration:  InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                fillColor: Colors.grey.shade200,
                filled: true,
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                  print(obscure);
                }, icon: Icon(
                  obscure ?
                    Icons.visibility_off_outlined : Icons.visibility
                ),

                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                labelText: "Password",
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              print("email controller ${emailController.text}");
              print("password controller ${passwordController.text}");
              print("login");
            },
            child: Text("Login"),
            )
          ],
        ),
      ),

    );
  }
}
