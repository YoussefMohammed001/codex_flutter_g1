class NewsResponseModel{
 final String status;
final int totalResults;
final List<Articles> articles;
  NewsResponseModel({required this.status,required this.totalResults,required this.articles});

  factory NewsResponseModel.fromJson(Map<String,dynamic> json){
    return NewsResponseModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles:(json['articles']  as List<dynamic>).map((e) => Articles.fromJson(e as Map<String,dynamic>)).toList(),
    );
  }

}

class Articles{
  final Source source;
   final String author;
   final String title;
final String description;
final String url;
final String urlToImage;
final String publishedAt;
final String content;

  Articles({required this.source,required this.author,required this.title,required this.description,
      required this.url,required this.urlToImage,required this.publishedAt,required this.content});

  factory Articles.fromJson(Map<String,dynamic> json){
    return Articles(
        source: Source.fromJson(json['source']),
        author: json['author'] ?? "Unknown",
        title: json['title'],
        description: json['description'] ?? "",
        url: json['url'], urlToImage: json['urlToImage'] ?? "https://plus.unsplash.com/premium_photo-1682310096066-20c267e20605?q=80&w=2712&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        publishedAt: json['publishedAt'],
        content: json['content'] ?? "Unknown",
    );
  }
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id: json['id'] ?? "Unknown",
      name: json['name'],
    );
  }
}