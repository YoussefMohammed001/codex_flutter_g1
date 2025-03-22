import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  List<NoteModel> notes  = [
    NoteModel(title: 'notes 1', body: 'body 1',),
    NoteModel(title: 'notes 2', body: 'body 2',),
    NoteModel(title: 'notes 3', body: 'body 3',),
    NoteModel(title: 'notes 4', body: 'body 4',),
    NoteModel(title: 'notes 5', body: 'body 5',),
  ];

  getNotes() async{
    emit(GetNotesLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(GetNotesLoadedState(notes: notes));
  }

  addNote(NoteModel noteModel){
















    notes.add(noteModel);
    emit(AddNoteSuccessState());
    emit(GetNotesLoadedState(notes: notes));
  }

  deleteNote(NoteModel noteModel){
    notes.remove(noteModel);
    emit(GetNotesLoadedState(notes: notes));
  }


}


