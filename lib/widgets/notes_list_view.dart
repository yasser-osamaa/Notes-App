import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/widgets/custom_note.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<NotesCubit>(context).notes!.length,
            itemBuilder: (context, index) {
              return CustomNote(
                note: BlocProvider.of<NotesCubit>(context).notes![index],
              );
            },
          ),
        );
      },
    );
  }
}
