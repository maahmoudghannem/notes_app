import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.maxLines = 1,
    this.fontSize = 15,
    this.obSecure = false,
    this.textColor = Colors.white,
    this.focusedBorderColor = Colors.white,
    this.enabledBorderColor = Colors.white,
    this.cursorColor = Colors.white,
  });
  Function(String)? onChanged;
  final String labelText;
  final double fontSize;
  final bool obSecure;
  final Color cursorColor;
  final Color focusedBorderColor, enabledBorderColor, textColor;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: cursorColor,
      onChanged: onChanged,
      obscureText: obSecure,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: fontSize, color: textColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
