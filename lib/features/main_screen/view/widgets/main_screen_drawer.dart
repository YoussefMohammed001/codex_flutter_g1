import 'package:codex_flutter_g1/features/login/view/screen/login_screen.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/empty_person.png"),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ahmed Mohamed Ahmed",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),), Text("view profile", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,

                      ),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Divider(),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.notifications_none_rounded),
              title: Text("Notifications"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border_rounded),
              title: Text("Favorites"),
            ),
            ListTile(
              leading: Icon(Icons.pest_control_rodent_outlined),
              title: Text("Orders"),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("FAQS"),
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text("Complains"),
            ),

            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text("Privacy Policy"),
            ),
            Spacer(),
            Divider(),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences
                    .getInstance();
                prefs.remove("id");
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => LoginCubit(),
                    child: LoginScreen(),
                  );
                }

                ));
              },
              child: ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text("LogOut"),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
