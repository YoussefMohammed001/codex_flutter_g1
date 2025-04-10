import 'package:codex_flutter_g1/features/news/model/news_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
   NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=909b3d38497c4cf281f6d015637a501e'
  // base url => https://newsapi.org/v2/
  // endpoint => top-headlines
  // query parameter => country=us, apiKey=909b3d38497c4cf281f6d015637a501e, category=general
  final dio = Dio();
  bool isLoading = true;
    NewsResponseModel?  newsResponseModel;
     getTopHeadlines({required String category}) async{
        isLoading = true;
       final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=909b3d38497c4cf281f6d015637a501e');
       print(response);
       // print("data ===>>>>> ${response.data['articles'][0]['source']['name']}");
       // print("data ===>>>>> ${response.data['articles'][0]['urlToImage']}");
       // source = response.data['articles'][0]['source']['name'];
       // createdAt = response.data['articles'][0]['publishedAt'];
       // urlToImage = response.data['articles'][0]['urlToImage'];
       // author = response.data['articles'][0]['author'] ?? "unknown";
       // title = response.data['articles'][0]['title'];
       // description = response.data['articles'][0]['description'];
        newsResponseModel = NewsResponseModel.fromJson(response.data);
        isLoading = false;
        setState(() {

        });
       print("news response ===>>> $newsResponseModel");
     }


     @override
  void initState() {
    getTopHeadlines(category: 'general');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index){
              setState(() {

              });
              print(index);
            switch(index){
              case 0:
                getTopHeadlines(category: 'general');
                break;
              case 1:
                getTopHeadlines(category: 'business');
                break;
              case 2:
                getTopHeadlines(category: 'entertainment');
                break;
              case 3:
                getTopHeadlines(category: 'health');
                break;
              case 4:
                getTopHeadlines(category: 'science');
                break;
            }


            },
              isScrollable: true,
              tabs: [
            Tab(text: "General",),
            Tab(text: "Business",),
            Tab(text: "Entertainment",),
            Tab(text: "Health",),
            Tab(text: "Science",),
          ]),
          title: Text("News",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          backgroundColor: Colors.green,
        ),

        body: isLoading ? Center(child: CircularProgressIndicator(),) :
        isLoading == false && newsResponseModel!.articles.isEmpty? Center(child: Text("No Data Available"))  :  ListView.builder(
          itemCount: newsResponseModel!.articles.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,

                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                    spreadRadius:  3,
                    blurRadius: 5,
                    offset: Offset(0,3)

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
                            Text(newsResponseModel!.articles[index].author,style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis
                            ),),

                            Text(newsResponseModel!.articles[index].publishedAt,style: TextStyle(
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
                        child: Text(newsResponseModel!.articles[index].source.name,style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines:1,
                        ),
                      ),

                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        newsResponseModel!.articles[index].urlToImage,)),
                  Text(newsResponseModel!.articles[index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),

                  ),
                  Text(newsResponseModel!.articles[index].description,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),

                ],
              ),
            );
          },
        )
      ),
    );
  }
}
