// ignore_for_file: prefer_const_constructors, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/login_screen.dart';

class Login_Button extends StatelessWidget {
  const Login_Button({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: size.width * 0.7,
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
                  return LogIn_Screen();
                },
              ),
            );
          },
          child: Text(
            "Login with Email",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
