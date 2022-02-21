import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/pages/all_investigations.dart';
import 'package:flutter_police_app/pages/new_investigation.dart';
import 'package:flutter_police_app/widgets/SingleInvestigationWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentInvestigations extends StatefulWidget {
  const RecentInvestigations({Key? key}) : super(key: key);

  @override
  _RecentInvestigationsState createState() => _RecentInvestigationsState();
}

class _RecentInvestigationsState extends State<RecentInvestigations> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 130,
                          child: Image.asset('assets/images/1.png')),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              primary: Colors.red),
                          child: Text("Logout"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewInvestigation()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          primary: Colors.red),
                      child: Text("New Investigation"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Investigations",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllInvestigations()),
                          );
                        },
                        child: Row(
                          children: [
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SingleInvestigationWidget(
                          title: "Investigation 1",
                          network: 1,
                          date: "21-12-2021",
                          time: "11.25 P.M."),
                      SingleInvestigationWidget(
                          title: "Investigation 2",
                          network: 2,
                          date: "21-12-2021",
                          time: "11.25 P.M."),
                      SingleInvestigationWidget(
                          title: "Investigation 3",
                          network: 3,
                          date: "21-12-2021",
                          time: "11.25 P.M."),
                      SingleInvestigationWidget(
                          title: "Investigation 4",
                          network: 4,
                          date: "21-12-2021",
                          time: "11.25 P.M."),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
