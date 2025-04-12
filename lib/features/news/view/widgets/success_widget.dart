import 'package:codex_flutter_g1/features/news/model/news_response_model.dart';
import 'package:codex_flutter_g1/features/news/view/widgets/news_item.dart';
import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
   SuccessWidget({super.key, required this.articles});
final List<Articles> articles;
  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return Center(child: Text("No News",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.w700),));
    }
    else {
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsItem(articles:articles[index],);
        },
      );
    }
  }
}
