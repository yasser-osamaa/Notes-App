import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNotesView();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 16,
          ),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.trash,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
