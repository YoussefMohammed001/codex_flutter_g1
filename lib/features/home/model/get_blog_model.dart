class GetBlogModel{
  final String id;
  final String uid;
  final String title;
  final String description;
  String? image;
  final  String date;

  GetBlogModel({required this.uid,required this.title,required this.description,this.image,required this.date,required this.id});


  factory  GetBlogModel.fromJson(Map<String,dynamic> json){
    return GetBlogModel(
      id:json["id"],
      uid:json["uid"],
      title:json["title"],
      description:json["description"],
      image:json["image"],
      date:json["date"],
    );
  }

}