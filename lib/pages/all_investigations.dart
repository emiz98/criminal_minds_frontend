import 'package:flutter/material.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/SingleInvestigationWidget.dart';
import 'package:flutter_police_app/widgets/SortWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AllInvestigations extends StatelessWidget {
  final List investigations;
  const AllInvestigations({Key? key, required this.investigations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                AppHeader(
                    title: "All Investigations",
                    includeSearch: false,
                    goToInvestigations: false),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                          investigations.length,
                          (index) => SingleInvestigationWidget(
                              inv_id: investigations[index]['id'],
                              title: investigations[index]['name'],
                              network: investigations[index]['network'],
                              date: investigations[index]['created_at'],
                              time: "11.25 P.M.")),
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
