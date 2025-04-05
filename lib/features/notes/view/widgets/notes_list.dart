import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      buildWhen: (previous, current) =>
          current is GetNotesLoadedState || current is DeleteNoteSuccessState,
      builder: (context, state) {
        return context.read<NotesCubit>().notes.isEmpty && (state is GetNotesLoadedState || state is DeleteNoteSuccessState)
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "you don't have any notes yet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            : ListView.builder(
                itemCount: context.read<NotesCubit>().notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    noteModel: context.read<NotesCubit>().notes[index],
                    index: index,
                  );
                });
      },
    );
  }
}
