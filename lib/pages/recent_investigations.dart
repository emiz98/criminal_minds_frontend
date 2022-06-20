import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:flutter_police_app/pages/all_investigations.dart';
import 'package:flutter_police_app/pages/login_splash.dart';
import 'package:flutter_police_app/pages/new_investigation.dart';
import 'package:flutter_police_app/widgets/SingleInvestigationWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecentInvestigations extends StatefulWidget {
  const RecentInvestigations({Key? key}) : super(key: key);

  @override
  _RecentInvestigationsState createState() => _RecentInvestigationsState();
}

class _RecentInvestigationsState extends State<RecentInvestigations> {
  @override
  void initState() {
    load();
  }

  List investigations = [];
  bool loading = false;
  bool logoutToggle = false;

  load() async {
    final String token = await getToken();
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.parse(getInvestigations),
        headers: {"Authorization": "TOKEN " + token.toString()});

    setState(() {
      var investigationsDecode = json.decode(response.body);
      investigations = investigationsDecode;
      loading = false;
    });
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login_Splash()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(textStyle: TextStyle(color: white)),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            color: white,
            child: logoutToggle
                ? CupertinoAlertDialog(
                    title: Text("Sign Out"),
                    content: Text("Do you really want to sign out?"),
                    actions: [
                      CupertinoDialogAction(
                          child: Text("No"),
                          onPressed: () {
                            setState(() {
                              logoutToggle = false;
                            });
                          }),
                      CupertinoDialogAction(
                          child: Text("Yes"), onPressed: () => logout())
                    ],
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 130,
                                      child:
                                          Image.asset('assets/images/1.png')),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.logout,
                                      color: primary,
                                      size: 30,
                                    ),
                                    onTap: () async {
                                      setState(() {
                                        logoutToggle = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Recent Investigations",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllInvestigations(
                                                  investigations:
                                                      investigations)),
                                    );
                                  },
                                  child: investigations.length > 0
                                      ? Row(
                                          children: const [
                                            Text(
                                              "View All",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              size: 18,
                                            )
                                          ],
                                        )
                                      : const SizedBox(),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                if (investigations.length == 0 && !loading) ...[
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Image.asset(
                                    'assets/images/notfound.png',
                                    scale: 2.5,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "No Investigation Found",
                                    style:
                                        TextStyle(color: primary, fontSize: 15),
                                  )
                                ]
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            LayoutBuilder(builder: (context, constraints) {
                              if (!loading) {
                                return Column(
                                  children: [
                                    Column(
                                      children: List.generate(
                                          investigations.length > 5
                                              ? 5
                                              : investigations.length,
                                          (index) => SingleInvestigationWidget(
                                              inv_id: investigations[index]
                                                  ['id'],
                                              title: investigations[index]
                                                  ['name'],
                                              network: investigations[index]
                                                  ['network'],
                                              date: investigations[index]
                                                  ['created_at'],
                                              time: "11.25 P.M.")),
                                    )
                                  ],
                                );
                              } else {
                                return Container(
                                  height: size.height - 300,
                                  child: Center(
                                      child: Lottie.asset(
                                          "assets/lottie/loader.json")),
                                );
                              }
                            }),
                          ],
                        ),
                        Positioned(
                          bottom: 20,
                          right: 0,
                          child: ElevatedButton(
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                primary: primary),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: NewInvestigation(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 200),
                                    reverseDuration:
                                        Duration(milliseconds: 200)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
