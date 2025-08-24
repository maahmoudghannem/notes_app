import 'package:flutter/material.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/widgets/custom_app_bar.dart';
import 'package:notess_app/widgets/custom_button.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(title: "Edit Note", icon: Icons.done_rounded),
            SizedBox(height: 40),
            CustomTextField(
              cursorColor: kPrimaryColor,
              labelText: "Title",
              textColor: kPrimaryColor,
              focusedBorderColor: kPrimaryColor,
            ),
            SizedBox(height: 16),
            CustomTextField(
              cursorColor: kPrimaryColor,
              labelText: "Content",
              textColor: kPrimaryColor,
              focusedBorderColor: kPrimaryColor,
              maxLines: 5,
            ),
            SizedBox(height: 32),
            CustomButton(
              text: "Add",
              fontSize: 20,
              containerColor: kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
