import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

//part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchNotes() {
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = box.values.toList();
      emit(NoteSuccess(notes: notes));
    } catch (e) {
      emit(NoteFailure(errMsg: e.toString()));
    }
  }
}
