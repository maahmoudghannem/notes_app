// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/views/notes_edit_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(Icons.delete_rounded, size: 30, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
