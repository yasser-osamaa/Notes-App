import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: 'Title',
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
