class NotesStates {}

class AddNoteInitial extends NotesStates {}

class AddNoteLoading extends NotesStates {}

class AddNoteSuccess extends NotesStates {}

class AddNoteFailure extends NotesStates {
  final String errMsg;

  AddNoteFailure({required this.errMsg});
}
