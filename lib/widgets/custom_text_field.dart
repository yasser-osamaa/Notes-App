import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: outLineBorder(),
        enabledBorder: outLineBorder(),
        focusedBorder: outLineBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder outLineBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
