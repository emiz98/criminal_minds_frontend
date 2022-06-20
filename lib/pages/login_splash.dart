import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:flutter_police_app/pages/login.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Splash extends StatefulWidget {
  const Login_Splash({Key? key}) : super(key: key);

  @override
  State<Login_Splash> createState() => _Login_SplashState();
}

class _Login_SplashState extends State<Login_Splash> {
  @override
  void initState() {
    loadData();
  }

  loadData() async {
    final token = await getToken();
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecentInvestigations()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(textStyle: TextStyle(color: white)),
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/images/1.png',
                  width: size.width * 0.7,
                  height: size.width * 0.7,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 50),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        primary: primary),
                    child: Text("Log in with Username"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
