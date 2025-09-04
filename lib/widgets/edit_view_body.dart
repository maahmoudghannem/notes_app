import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/custom_app_bar.dart';
import 'package:notess_app/widgets/custom_text_field.dart';
import 'package:notess_app/widgets/edit_notes_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 65),
            CustomAppBar(
              title: "Edit Note",
              icon: Icons.done_rounded,
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 185),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              cursorColor: kPrimaryColor,
              labelText: widget.note.title,
              textColor: kPrimaryColor,
              focusedBorderColor: kPrimaryColor,
            ),
            SizedBox(height: 16),
            CustomTextField(
              onChanged: (value) {
                subTitle = value;
              },
              cursorColor: kPrimaryColor,
              labelText: widget.note.subTitle,
              textColor: kPrimaryColor,
              focusedBorderColor: kPrimaryColor,
              maxLines: 5,
            ),
            SizedBox(height: 32),
            EditNotesColor(note: widget.note),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
