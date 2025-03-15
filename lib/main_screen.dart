import 'package:codex_flutter_g1/home_screen.dart';
import 'package:codex_flutter_g1/reusable_widgets/app_svg.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key,});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> screens = [
    HomeScreen(),
    const Center(child: Text("Orders")),
  ];
  int index = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar:FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: index,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          this.index = index;
        }),
        items: [
          FlashyTabBarItem(
            icon:AppSvg(image: "home"),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon:AppSvg(image: "my_orders"),
            title: Text('Events'),
          ),

        ],
      ),
      body: screens[index],
      floatingActionButton: Visibility(
        visible: index == 0,
        child: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}