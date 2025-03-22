import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.noteModel});
final  NoteModel noteModel;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.noteModel.title),
                Text(widget.noteModel.body),
              ],
            )),
            IconButton(onPressed: () {

            },
                icon: Icon(
                  Icons.delete_outline_rounded, color: Colors.red,))
          ],
        ));
  }
}
