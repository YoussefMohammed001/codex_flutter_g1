import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/add_note_bottom_sheet.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/notes_list.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
 const  NotesScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if(state is GetNotesLoadingState){
          print("$state loading");
        } else if(state is GetNotesLoadedState){
          print("$state loaded");
        } else if(state is GetNotesErrorState){
          print("$state error");
        } else if(state is AddNoteSuccessState){
          print("$state success");
          showSnackBar(context: context, title:  "Note Added", color: Colors.black, onPressed: () {
          });
          Navigator.pop(context);
        } else if(state is DeleteNoteSuccessState){
          print("$state success");
          showSnackBar(context: context, title:  state.message, color: Colors.black, onPressed: () {
          });
        } else if(state is DeleteNoteErrorState) {
          showSnackBar(context: context, title:  state.message, color: Colors.red, onPressed: () {

          });
          print("${state.message} error");
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                showAddNoteBottomSheet(context: context,);
              },
            
              child: Icon(Icons.add, color: Colors.white,),
            
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: (){
            },
              child: Icon(Icons.print_outlined, color: Colors.white,),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child: NotesList()),
          ],
        ),
      ),
    );
  }

}