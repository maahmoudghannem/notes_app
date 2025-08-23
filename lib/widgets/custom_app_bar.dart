import 'package:flutter/material.dart';
import 'package:notess_app/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Notes",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        Spacer(flex: 1),
        CustomSearchIcon(),
      ],
    );
  }
}
