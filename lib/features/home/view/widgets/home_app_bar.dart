import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("Home",style: TextStyle(
          fontWeight: FontWeight.w700
      ),
      ),
      backgroundColor: AppColors.primaryColor,
      elevation: 10,
    );
  }

  @override
  Size get preferredSize {
   return  Size.fromHeight(kToolbarHeight);
  }
}
