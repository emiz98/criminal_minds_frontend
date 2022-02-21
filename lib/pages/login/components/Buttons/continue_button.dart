// ignore_for_file: deprecated_member_use, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/login_screen.dart';

class Continue_Button extends StatelessWidget {
  const Continue_Button({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: RaisedButton(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: const Color.fromARGB(255, 156, 44, 36),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LogIn_Screen(); //Should redirect to main home page after login
                },
              ),
            );
          },
          child: const Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
