import 'package:flutter/material.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/widgets/custom_button.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            cursorColor: kPrimaryColor,
            labelText: "Title",
            textColor: kPrimaryColor,
            focusedBorderColor: kPrimaryColor,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            cursorColor: kPrimaryColor,
            labelText: "Content",
            textColor: kPrimaryColor,
            focusedBorderColor: kPrimaryColor,
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            text: "Add",
            fontSize: 20,
            containerColor: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
