import 'package:flutter/material.dart';
import 'package:notess_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        Spacer(flex: 1),
        CustomIcon(icon: icon, onTap: onTap),
      ],
    );
  }
}
