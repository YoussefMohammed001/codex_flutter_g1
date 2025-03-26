import 'package:codex_flutter_g1/database/app_database.dart';
import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/notes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(

      listener: (BuildContext context,  state) {
      if(state is AddNoteSuccessState){
        print("notes added");
        Navigator.pop(context);
        final snackBar = SnackBar(content: Text('notes added',
          style: TextStyle(color: Colors.white),
        ),
          backgroundColor: Colors.black,
          action: SnackBarAction(
            label: 'Undo', onPressed: () {

          },

          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar, );
      }else if(state is GetNotesLoadedState){

        print("notes loaded");

      } else if(state is GetNotesLoadingState){
        print("notes loading");
      }

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes", style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext bottomSheetContext) {
                return Container(
                  height: 350,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    spacing: 20,
                    children: <Widget>[
                      const Text('Add Note', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,

                      ),),

                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter title",
                        ),
                      ),
                      TextFormField(
                        controller: bodyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter body",
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(200, 50),
                        ),
                        child: const Text("Add Note",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          AppDatabase.insertNote(noteModel: NoteModel(
                              title: titleController.text, body: bodyController.text
                          ));
                          titleController.clear();
                          bodyController.clear();
                          Navigator.pop(context);
                          context.read<NotesCubit>().getNotes();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },


          child: Icon(Icons.add, color: Colors.white,),

        ),
        body: NotesList(),
      ),
    );
  }

}