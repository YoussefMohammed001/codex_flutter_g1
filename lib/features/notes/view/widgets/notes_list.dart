import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  NotesList extends StatelessWidget {
  const  NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if(state is GetNotesLoadedState ){
          return state.notes.isEmpty ? Center(child: Text("No notes")) :
          ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return NoteItem(noteModel: state.notes[index] ,);
              });
        } else if(state is GetNotesLoadingState){
          return Center(child: CircularProgressIndicator());
        } else{
          return SizedBox();
        }

      },
    );
  }
}
