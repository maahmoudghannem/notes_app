import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/colors_list.dart';
import 'package:notess_app/widgets/custom_button.dart';
import 'package:notess_app/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
          const SizedBox(height: 20),
          ColorsList(),
          const SizedBox(height: 20),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatDate = DateFormat.yMd().format(currentDate);
                    NoteModel noteModel = NoteModel(
                      title: title!,
                      date: formatDate,
                      subTitle: subTitle!,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() => autovalidateMode = AutovalidateMode.always);
                  }
                },
                text: "Add",
                fontSize: 20,
                containerColor: kPrimaryColor,
                fontWeight: FontWeight.w500,
              );
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
