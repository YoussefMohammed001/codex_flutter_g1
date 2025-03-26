import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/database/app_database.dart';
import 'package:codex_flutter_g1/features/notes/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  List<NoteModel> notes   = [];

  getNotes() async {
    print("get notes");
    emit(GetNotesLoadingState());

    try{
      notes =  await AppDatabase.getNotes();
      print("notes loaded from cubit $notes");
      emit(GetNotesLoadedState());
    } catch(e){
      emit(GetNotesErrorState(e.toString()));
      print("e  ====> $e");
    }

  }

}


