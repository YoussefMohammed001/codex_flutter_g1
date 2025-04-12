import 'package:codex_flutter_g1/features/news/model/news_response_model.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articles});
final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,

        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3)

          )
        ],
        border: Border.all(
            color: Colors.grey.shade300
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 40,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articles.author, style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis
                    ),),

                    Text(articles.publishedAt, style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                        overflow: TextOverflow.ellipsis
                    ),),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(articles.source.name, style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
                  maxLines: 1,
                ),
              ),

            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                articles.urlToImage,)),
          Text(articles.title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),

          ),
          Text(articles.description,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15
            ),
          ),

        ],
      ),
    );
  }
}
