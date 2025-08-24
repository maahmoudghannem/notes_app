import 'package:flutter/material.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/widgets/add_note_buttom_sheet.dart';
import 'package:notess_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNoteButtomSheet();
            },
          );
        },
        backgroundColor: kPrimaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: Colors.black),
      ),
    );
  }
}
