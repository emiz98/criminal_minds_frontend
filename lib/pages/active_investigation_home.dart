import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/CallsWidget.dart';
import 'package:flutter_police_app/widgets/UserWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveInvestigationHome extends StatefulWidget {
  const ActiveInvestigationHome({Key? key}) : super(key: key);

  @override
  State<ActiveInvestigationHome> createState() =>
      _ActiveInvestigationHomeState();
}

class _ActiveInvestigationHomeState extends State<ActiveInvestigationHome> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppHeader(title: "New Investigation", includeSearch: true),
                  UserWidget(networkId: 1, number: "071 555 5555"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.mobile_friendly_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IMEI",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "1234 5678 9123 456",
                                style: TextStyle(color: black.withOpacity(0.6)),
                              ),
                              Text(
                                "1234 5678 9123 456",
                                style: TextStyle(color: black.withOpacity(0.6)),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sim_card_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IMSI",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "1234 5678 9123 456",
                                style: TextStyle(color: black.withOpacity(0.6)),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: RaisedButton.icon(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          color: primary,
                          onPressed: () {},
                          icon: Icon(
                            Icons.navigation,
                            color: white,
                          ),
                          label: Text(
                            "Track",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: white),
                          )),
                    ),
                  ),
                  CallsWidget()
                ],
              ),
            ),
          )),
    );
  }
}
