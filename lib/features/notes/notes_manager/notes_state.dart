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
class AddNoteLoadingState extends NotesState {}
class AddNoteErrorState extends NotesState {}


class DeleteNoteLoadingState extends NotesState {}
class DeleteNoteSuccessState extends NotesState {
  final String message;
  DeleteNoteSuccessState(this.message);
}
class DeleteNoteErrorState extends NotesState {
  final String message;
  DeleteNoteErrorState(this.message);
}
