part of 'notes_cubit.dart';

class NotesState {}

class NotesInitialState extends NotesState {}

class GetNotesLoadingState extends NotesState {}

class GetNotesLoadedState extends NotesState {
  final List<NoteModel> notes;
  GetNotesLoadedState({required this.notes});
}

class AddNoteSuccessState extends NotesState {}
