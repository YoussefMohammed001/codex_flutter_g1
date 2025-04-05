import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/widgets/add_note_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel, required this.index});

  final NoteModel noteModel;
  final int index;

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            color:  noteModel.isCritical == 1 ? Colors.green[100] : Colors.grey[300],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Text(noteModel.id.toString(),

                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(noteModel.title!),
                    Text(noteModel.body!),
                  ],
                ),
              ),
              IconButton(onPressed: () async {
                showAddNoteBottomSheet(context: context,isUpdate: true,noteModel: noteModel);
              }, icon: Icon(Icons.edit_outlined, color: Colors.black,)),
              IconButton(onPressed: () async {
                await context.read<NotesCubit>().deleteNote(index: index);
              }, icon: Icon(Icons.delete, color: Colors.red,)),


            ],
          ),
        );
  }
}
