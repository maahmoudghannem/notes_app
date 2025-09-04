import 'package:flutter/material.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/colors_list.dart';

class EditNotesColor extends StatefulWidget {
  const EditNotesColor({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesColor> createState() => _EditNotesColorState();
}

class _EditNotesColorState extends State<EditNotesColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => setState(() {
                widget.note.color = kColors[index].value;
                currentIndex = index;
              }),
              child: ColorsItem(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
