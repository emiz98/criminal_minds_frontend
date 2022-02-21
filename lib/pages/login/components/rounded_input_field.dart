// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xFF5B5B5B),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
