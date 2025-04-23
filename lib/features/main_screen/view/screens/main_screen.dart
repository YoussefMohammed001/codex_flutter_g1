
import 'package:codex_flutter_g1/features/categories/view/screens/categories_screen.dart';
import 'package:codex_flutter_g1/features/main_screen/view/widgets/main_screen_drawer.dart';
import 'package:codex_flutter_g1/features/search/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../home/view/screens/home_screen.dart' show HomeScreen;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens  = [
    HomeScreen(),
    CategoriesScreen(),
    SearchScreen(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: index == 0,
          child: Container(
              alignment: Alignment.centerRight,
              child: Icon(Icons.shopping_cart_outlined)),
        ),
      ),
      drawer: MainScreenDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
        onTap: (v){
setState(() {
  index = v;
});
        },
          items: [

            BottomNavigationBarItem(
              label:"Home" ,
              icon: Icon(Icons.home_outlined),

            ),
            BottomNavigationBarItem(
              label:"Categories" ,
              icon: Icon(Icons.category_outlined),
            ),
            BottomNavigationBarItem(
              label:"Search" ,
              icon: Icon(Icons.search),
            ),

      ]),
      body: screens[index],
    );
  }
}
