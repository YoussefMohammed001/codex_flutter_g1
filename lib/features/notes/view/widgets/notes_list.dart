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

        if(state is GetNotesLoadedState){
          return   ListView.builder(
              itemCount: context.read<NotesCubit>().notes.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text(context.read<NotesCubit>().notes[index].id.toString(),

                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.read<NotesCubit>().notes[index].title!),
                          Text(context.read<NotesCubit>().notes[index].body!),
                        ],
                      ),
                    ],
                  ),
                );
              });
        }else if(state is GetNotesErrorState){
          return Center(child: Text(state.message));
        }else{
          return SizedBox();
        }

      },
    );
  }
}
