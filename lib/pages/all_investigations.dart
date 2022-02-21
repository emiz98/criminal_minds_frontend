import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/SingleInvestigationWidget.dart';
import 'package:flutter_police_app/widgets/SortInvestigation.dart';
import 'package:google_fonts/google_fonts.dart';

class AllInvestigations extends StatelessWidget {
  const AllInvestigations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                AppHeader(
                  title: "All Investigations",
                ),
                SizedBox(
                  height: 30,
                ),
                SortInvestigation(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
