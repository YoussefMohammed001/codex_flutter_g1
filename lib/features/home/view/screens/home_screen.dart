import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/home/model/get_blog_model.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/blogs_list.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/home_app_bar.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, Routes.addBlogScreen);
          print("result => $result");
          if (result is GetBlogModel) {
            print(result.id);
            print(result.uid);
            print(result.title);
            print(result.description);
            print(result.date);
            print(result.image);
            setState(() {
              context.read<HomeCubit>().blogsList.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      body: BlogsList(),
    );
  }
}
