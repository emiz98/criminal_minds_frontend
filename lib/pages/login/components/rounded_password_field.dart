// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true, //Not showing the password in the textbox
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 85, 84, 84),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color.fromARGB(255, 85, 84, 84),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
