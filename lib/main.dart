// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/login_screen.dart';
import 'package:flutter_police_app/pages/splash_screen/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criminal Minds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DefaultTextStyle(
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(color: Colors.white)),
        child: Container(
          color: Colors.white,
          child: const Splash(),
        ),
      ),
    );
  }
}
