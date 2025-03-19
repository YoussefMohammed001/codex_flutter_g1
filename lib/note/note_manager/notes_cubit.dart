import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/note/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes  = [
    NoteModel(title: 'note 1', body: 'body 1',),
    NoteModel(title: 'note 3', body: 'body 2',),
  ];

  getNotes(){
    emit(GetNotes(notes: notes));
  }




}
