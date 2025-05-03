import 'package:codex_flutter_g1/features/add_blog/model/blog_model.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blogModel});
final BlogModel blogModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Colors.grey.shade300
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(blogModel.image!,
width: double.infinity,
              fit: BoxFit.fill,
              height: 200,)),
          Padding(
            padding:  EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(blogModel.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(blogModel.date,style: TextStyle(

                    )),

                  ],
                ),
                Divider(),
                Text(blogModel.description,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
