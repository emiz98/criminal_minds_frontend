// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_police_app/pages/WidgetTree.dart';
import 'package:flutter_police_app/pages/login_splash.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
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
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Scaffold(
        body: WidgetTree(),
      ),
    );
  }
}
