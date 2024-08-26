import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  TextEditingController? titleController;
  TextEditingController? subTitleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subTitleController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: const Icon(Icons.check),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              textControler: titleController,
              onChanged: (value) {
                widget.note.title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textControler: subTitleController,
              onChanged: (value) {
                widget.note.subTitle = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            EditColorListView(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
