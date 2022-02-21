import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/root_app.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
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
      home: SafeArea(
        child: DefaultTextStyle(
          style:
              GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
          child: Container(
            color: Colors.white,
            child: const RecentInvestigations(),
          ),
        ),
      ),
    );
  }
}
