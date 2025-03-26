part of 'notes_cubit.dart';

class NotesState {}

class NotesInitialState extends NotesState {}

class GetNotesLoadingState extends NotesState {}

class GetNotesLoadedState extends NotesState {
}
class GetNotesErrorState extends NotesState {
  final String message;
  GetNotesErrorState(this.message);
}

class AddNoteSuccessState extends NotesState {}
