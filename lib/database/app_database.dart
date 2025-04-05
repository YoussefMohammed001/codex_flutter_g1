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
      //for bool  0 >  false, 1 > true
      await db.execute('CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT, isCritical INTEGER)');
       print("table created");
    },
    onOpen: (db){
      database =db;
      print("database opened");
    }
  );
 }

 static  insertNote({required NoteModel noteModel}) async {
   await database!.insert("Notes", noteModel.toMap());
   print("note inserted");
 }

 static Future<List<NoteModel>> getNotes() async {
  List<Map> list =  await  database!.rawQuery("SELECT * FROM Notes");
  print(list);
  return list.map((e)  => NoteModel.fromMap(e)).toList();
 }

 static Future<void> deleteNote({required int id}) async {
   await database!.delete("Notes",where: "id = ?",whereArgs: [id]);
 }

}