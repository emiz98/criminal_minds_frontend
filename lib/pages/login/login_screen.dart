// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/components/Buttons/continue_button.dart';
import 'package:flutter_police_app/pages/login/components/rounded_input_field.dart';
import 'package:flutter_police_app/pages/login/components/rounded_password_field.dart';
import 'package:flutter_police_app/pages/splash_screen/splash.dart';

class LogIn_Screen extends StatelessWidget {
  const LogIn_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }
}

class layout extends StatelessWidget {
  const layout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/1.png',
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              //Parent container for all content
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign in to your account",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: RoundedInputField(
                hintText: "Email                user@gmail.com",
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: RoundedPasswordField(
                onChanged: (value) {},
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                onTap: () => {},
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Continue_Button(size: size),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      child: Text(
                        'Sign Up Now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Splash(); //Should redirect to main home page after login
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
