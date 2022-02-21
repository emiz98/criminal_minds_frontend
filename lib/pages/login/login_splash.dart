// ignore_for_file: deprecated_member_use, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/components/Buttons/log_in_button.dart';
import 'package:flutter_police_app/pages/login/components/Buttons/sign_up_button.dart';

class Login_Splash extends StatelessWidget {
  const Login_Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            splash_body(size: size),
          ],
        ),
      ),
    );
  }
}

class splash_body extends StatelessWidget {
  const splash_body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/1.png',
          width: size.width * 0.7,
          height: size.height * 0.7,
        ),
        SizedBox(height: size.height * 0.03),
        Login_Button(size: size),
        SizedBox(height: size.height * 0.03),
        SignUp_Button(size: size),
      ],
    );
  }
}
