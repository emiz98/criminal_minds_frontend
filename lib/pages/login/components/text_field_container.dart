// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xFFC2C2C2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
