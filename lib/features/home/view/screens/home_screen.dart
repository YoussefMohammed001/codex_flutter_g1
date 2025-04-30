import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/blogs_list.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, Routes.addBlogScreen);
      },
      child: Icon(Icons.add),

      ),
      body: Column(
        children: [
          BlogsList(),
        ],
      ),
    );
  }
}
