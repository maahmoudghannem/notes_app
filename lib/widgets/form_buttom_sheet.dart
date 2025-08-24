import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/custom_button.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

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
              subTitle = value;
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
                NoteModel noteModel = NoteModel(
                  title: title!,
                  date: DateTime.now().toString(),
                  subTitle: subTitle!,
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
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
