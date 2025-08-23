import 'package:flutter/material.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/widgets/custom_button.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
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
