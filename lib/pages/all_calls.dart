import 'package:flutter/cupertino.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/SingleCall.dart';
import 'package:flutter_police_app/widgets/SortWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCalls extends StatefulWidget {
  const AllCalls({Key? key}) : super(key: key);

  @override
  State<AllCalls> createState() => _AllCallsState();
}

class _AllCallsState extends State<AllCalls> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(textStyle: TextStyle(color: black)),
        child: Container(
          color: white,
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(
                    title: "New Investigation",
                    includeSearch: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "All Outgoing Calls",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SortWidget(
                      text1: "Attempts",
                      text2: "Duration",
                      text3: "Date & Time"),
                  SizedBox(
                    height: 30,
                  ),
                  SingleCall(WidgetType: 1, callType: 1),
                  SizedBox(
                    height: 5,
                  ),
                  SingleCall(WidgetType: 1, callType: 2),
                  SizedBox(
                    height: 5,
                  ),
                  SingleCall(WidgetType: 1, callType: 2),
                  SizedBox(
                    height: 5,
                  ),
                  SingleCall(WidgetType: 1, callType: 1)
                ],
              )),
        ),
      ),
    );
  }
}
