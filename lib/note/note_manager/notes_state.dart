part of 'notes_cubit.dart';


 class NotesState {}

 class NotesInitial extends NotesState{}

class AddNote extends NotesState{}

class GetNotes extends NotesState{
  final List<NoteModel> notes;
  GetNotes({required this.notes});
}

class DeleteNote extends NotesState{}



