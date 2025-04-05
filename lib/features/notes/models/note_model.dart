class NoteModel{
   int? id = 0;
   String? title = "";
   String? body = "";
   int? isCritical = 0; // false


  NoteModel({this.title,  this.body,this.id,this.isCritical});

  NoteModel.fromMap(Map<dynamic,dynamic> map){
    title = map["title"];
    body = map["body"];
    id = map["id"];
    isCritical = map["isCritical"];
  }


 Map<String,dynamic> toMap(){
    return {
      "title":title,
      "body":body,
      "isCritical":isCritical,
    };
  }



}