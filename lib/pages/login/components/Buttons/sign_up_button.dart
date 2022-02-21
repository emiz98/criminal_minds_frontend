// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignUp_Button extends StatelessWidget {
  const SignUp_Button({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: RaisedButton(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2.5)),
          onPressed: () {},
          child: Text(
            "Sign Up with Email",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
