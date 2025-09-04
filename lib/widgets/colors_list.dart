import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 32, backgroundColor: color),
          )
        : CircleAvatar(radius: 36, backgroundColor: color);
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});
  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xffE5D4ED),
    Color(0xff6D72C3),
    Color(0xff5941A9),
    Color(0xff514F59),
    Color(0xff1D1128),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => setState(() {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              }),
              child: ColorsItem(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
