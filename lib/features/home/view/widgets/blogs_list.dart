import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/blog_item.dart';
import 'package:flutter/material.dart';

class BlogsList extends StatelessWidget {
  const BlogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,

        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return BlogItem();
        }, separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,

            ),
            child: const Divider(
              thickness: 2,
              color: Colors.grey,
              
            ),
          );
      },
      
      ),
    );
  }
}
