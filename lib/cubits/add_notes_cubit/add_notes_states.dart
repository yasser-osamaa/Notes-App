class AddNotesStates {}

class AddNoteInitial extends AddNotesStates {}

class AddNoteLoading extends AddNotesStates {} // when user is typing

class AddNoteSuccess extends AddNotesStates {}

class AddNoteFailure extends AddNotesStates {
  final String errMsg;

  AddNoteFailure({required this.errMsg});
}
