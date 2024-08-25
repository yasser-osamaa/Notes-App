import 'package:notes_app/models/note_model.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

class NoteSuccess extends NotesState {
  final List<NoteModel> notes;

  NoteSuccess({required this.notes});
}

class NoteFailure extends NotesState {
  final String errMsg;

  NoteFailure({required this.errMsg});
}
