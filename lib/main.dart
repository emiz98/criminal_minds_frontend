// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:flutter_police_app/pages/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criminal Minds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SafeArea(
        child: DefaultTextStyle(
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(color: Colors.white)),
          child: Container(
            color: Colors.white,
            child: const Splash(),
          ),
        ),
      ),
    );
  }
}
