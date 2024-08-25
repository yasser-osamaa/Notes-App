import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNoteInitial()); // initial state
  Color color = const Color(0xff8C1C13);
  addNotes(NoteModel note) async {
    emit(AddNoteLoading());
    // await Future.delayed(const Duration(seconds: 1));

    try {
      note.color = color.value;
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(
        AddNoteFailure(errMsg: e.toString()),
      );
    }
  }
}
