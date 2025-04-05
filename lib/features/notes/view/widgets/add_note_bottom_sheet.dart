import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showAddNoteBottomSheet({required BuildContext context, bool isUpdate = false, NoteModel? noteModel}) {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController(text: noteModel?.title);
  TextEditingController bodyController = TextEditingController(text: noteModel?.body);
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext bottomSheetContext) {
      return Form(
        key: formKey,
        child: Container(
          height: 350,
          margin: EdgeInsets.all(10),
          child: Column(
            spacing: 20,
            children: <Widget>[
               Text( isUpdate ? 'Update Note' : 'Add Note', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),),

              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return "Please enter title";
                  }
                  return null;
                },
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter title",
                ),
              ),
              TextFormField(
                validator: (v){
                  if(v!.isEmpty){
                    return "Please enter body";
                  }
                  return null;
                },
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
                child:  Text( isUpdate ? "Update Note" : "Add Note",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    if(isUpdate){
                      print(noteModel!.id);
                      print("update note");
                    }else{
                      context.read<NotesCubit>().insertNote(noteModel: NoteModel(
                          title: titleController.text, body: bodyController.text
                      ));
                      titleController.clear();
                      bodyController.clear();
                    }


                  }

                },
              ),
            ],
          ),
        ),
      );
    },
  );
}