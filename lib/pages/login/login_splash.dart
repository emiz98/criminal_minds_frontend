// ignore_for_file: deprecated_member_use, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/login_screen.dart';
import 'package:flutter_police_app/json/colors_json.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            'assets/images/1.png',
            width: size.width * 0.7,
            height: size.height * 0.7,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 50),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                primary: primary),
            child: Text("Log in with Email"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn_Screen()),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(500, 50),
                side: BorderSide(width: 2, color: Colors.black),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                primary: Colors.black,
              ),
              onPressed: () {},
              child: Text(
                "Sign up with Email",
              ))
        ],
      ),
    );
  }
}
