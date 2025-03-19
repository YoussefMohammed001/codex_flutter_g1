import 'package:codex_flutter_g1/note/note_manager/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}



class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            builder: (BuildContext context) {
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
                        setState(() {
                          // notes.add("")
                        });
                        Navigator.pop(context);
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
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if(state is GetNotes ){
            return ListView.builder(
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
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
                              Text(state.notes[index].title),
                              Text(state.notes[index].body),
                            ],
                          )),
                          IconButton(onPressed: () {
                            setState(() {
                              state.notes.removeAt(index);
                            });
                          },
                              icon: Icon(
                                Icons.delete_outline_rounded, color: Colors.red,))
                        ],
                      ));
                });
          } else{
            return SizedBox();
          }

        },
      ),
    );
  }
}
