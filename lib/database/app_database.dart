import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Database? database;


  // 1 crete database(init)
 static  Future init() async  {
   await openDatabase(
    "notes.db",
    version: 1,
    onCreate: (db,version) async {
      await db.execute('CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT)');
       print("table created");
    },
    onOpen: (db){
      database =db;
      print("database opened");
    }
  );
 }

 static  insertNote({required NoteModel noteModel}) async {
   await database!.insert("Notes",
   //     {
   //   "title":noteModel.title,
   //   "body":noteModel.body,
   // }
       noteModel.toMap()
   );
   print("note inserted");
   //await database!.rawQuery('INSERT INTO Notes(title, body) VALUES("title 2", "body 2")');
 }

 static Future<List<NoteModel>> getNotes() async {
  List<Map> list =  await  database!.rawQuery("SELECT * FROM Notes");
  print(list);
  return list.map((e)  => NoteModel.fromMap(e)).toList();
 }



}