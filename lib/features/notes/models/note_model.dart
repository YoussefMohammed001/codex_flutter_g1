class NoteModel{
   int? id = 0;
   String? title = "";
   String? body = "";


  NoteModel({this.title,  this.body,this.id});

  NoteModel.fromMap(Map<dynamic,dynamic> map){
    title = map["title"];
    body = map["body"];
    id = map["id"];
  }


 Map<String,dynamic> toMap(){
    return {
      "title":title,
      "body":body,
    };
  }



}