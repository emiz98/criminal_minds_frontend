import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool authenticating = false;
  bool _hidePassword = true;
  bool _username_error = false;
  bool _password_error = false;
  bool _login_error = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    setState(() {
      usernameController.text == ""
          ? _username_error = true
          : _username_error = false;

      passwordController.text == ""
          ? _password_error = true
          : _password_error = false;
    });
    if (!_username_error && !_password_error) {
      setState(() {
        authenticating = true;
      });
      final response = await http.post(Uri.parse(authenticateUser), body: {
        "username": usernameController.text,
        "password": passwordController.text
      });
      var responseDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        final storage = new FlutterSecureStorage();
        await storage.write(key: 'jwt', value: responseDecode['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecentInvestigations()),
        );
      } else {
        setState(() {
          authenticating = false;
          _login_error = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: GoogleFonts.montserrat(textStyle: TextStyle(color: black)),
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _login_error
                  ? AlertDialog(
                      title: Container(
                        height: 60,
                        child: Center(
                            child: Lottie.asset("assets/lottie/error.json",
                                reverse: true)),
                      ),
                      content: Text(
                        "Username or Password is not correct",
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _login_error = false;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            color: primary,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Okay",
                              style: TextStyle(color: white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: size.height,
                      width: size.width,
                      child: authenticating
                          ? Container(
                              height: size.height - 300,
                              child: Center(
                                  child: Lottie.asset(
                                      "assets/lottie/authenticating.json",
                                      reverse: true)),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppHeader(
                                  title: "",
                                  includeSearch: false,
                                  goToInvestigations: false,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC2C2C2),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: TextField(
                                            controller: usernameController,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.person,
                                                color: Color(0xFF5B5B5B),
                                              ),
                                              hintText: "Username",
                                              errorText: _username_error
                                                  ? "Please enter a valid username"
                                                  : null,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC2C2C2),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: TextField(
                                            controller: passwordController,
                                            obscureText: _hidePassword,
                                            decoration: InputDecoration(
                                              hintText: "Password",
                                              icon: Icon(
                                                Icons.lock,
                                                color: Color.fromARGB(
                                                    255, 85, 84, 84),
                                              ),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _hidePassword =
                                                        !_hidePassword;
                                                  });
                                                },
                                                child: Icon(
                                                  _hidePassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: Color.fromARGB(
                                                      255, 85, 84, 84),
                                                ),
                                              ),
                                              border: InputBorder.none,
                                              errorText: _password_error
                                                  ? "Please enter a valid password"
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(500, 50),
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                          primary: primary),
                                      child: Text("Sign in"),
                                      onPressed: () {
                                        signIn();
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              ],
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
