import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/add_blog/view/widgets/add_blog_form.dart';
import 'package:codex_flutter_g1/features/add_blog/view_model/add_blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, BlocProvider;

class AddBlogScreen extends StatelessWidget {
  const AddBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBlogCubit(),
      child: BlocListener<AddBlogCubit, AddBlogState>(
        listener: (context, state) {
          if (state is AddBlogSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blog Added",
            style: TextStyle(
              color: Colors.black
            ),
            ),
            backgroundColor: AppColors.primaryColor,
            ));
            Navigator.pop(context);
          }

        },
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AddBlogForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
