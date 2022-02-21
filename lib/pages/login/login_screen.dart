// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/components/Buttons/continue_button.dart';
import 'package:flutter_police_app/pages/login/components/rounded_input_field.dart';
import 'package:flutter_police_app/pages/login/components/rounded_password_field.dart';
import 'package:flutter_police_app/pages/splash_screen/splash.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: DefaultTextStyle(
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppHeader(title: ""),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "Sign in to your account",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        RoundedInputField(
                          hintText: "Email",
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RoundedPasswordField(
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot password ?",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Continue_Button(size: size),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Sign Up Now',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
