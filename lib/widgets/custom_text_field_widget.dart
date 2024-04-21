import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
    this.prefixIcon, {
    super.key,
    required this.hintText,
    required this.textInputAction,
    required this.onChanged,
  });
  final String hintText;
  final ValueChanged<String> onChanged;
  final Icon prefixIcon;
  final TextInputAction textInputAction;
  //final Icon suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.white,
        //suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      textInputAction: textInputAction,
      cursorColor: Colors.white,
      validator: (value) {
        if (value!.isEmpty) {
          return "Make sure you're write everything right";
        }
        return null;
      },
    );
  }
}
