import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/CallsWidget.dart';
import 'package:flutter_police_app/widgets/UserWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class ActiveInvestigationHome extends StatefulWidget {
  final String investigationId;
  const ActiveInvestigationHome({Key? key, required this.investigationId})
      : super(key: key);

  @override
  State<ActiveInvestigationHome> createState() =>
      _ActiveInvestigationHomeState();
}

class _ActiveInvestigationHomeState extends State<ActiveInvestigationHome> {
  @override
  void initState() {
    load();
  }

  late Map<String, dynamic> investigationData;
  bool loading = true;
  bool deleteToggle = false;
  bool deleting = false;

  load() async {
    final String token = await getToken();
    final response = await http.get(
        Uri.parse(getInvestigationData + widget.investigationId.toString()),
        headers: {"Authorization": "TOKEN " + token.toString()});

    setState(() {
      Map<String, dynamic> investigationDataDecode = json.decode(response.body);
      investigationData = investigationDataDecode;
      loading = false;
      print(investigationData['investigation']['network']);
    });
  }

  DeleteInvestigation() async {
    final String token = await getToken();
    setState(() {
      deleting = true;
    });
    final deleteResponse = await http.get(
        Uri.parse(deleteInvestigation + widget.investigationId.toString()),
        headers: {"Authorization": "TOKEN " + token.toString()});

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecentInvestigations()),
      );
      deleting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTextStyle(
          style: GoogleFonts.montserrat(textStyle: TextStyle(color: black)),
          child: loading
              ? Container(
                  color: white,
                  height: size.height - 300,
                  child:
                      Center(child: Lottie.asset("assets/lottie/loader.json")),
                )
              : deleting
                  ? Container(
                      color: white,
                      height: size.height - 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/lottie/delete.json"),
                          Text("Deleting investigation please wait!")
                        ],
                      ),
                    )
                  : WillPopScope(
                      onWillPop: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecentInvestigations()),
                        );
                        return false;
                      },
                      child: Container(
                        color: white,
                        child: deleteToggle
                            ? CupertinoAlertDialog(
                                title: Text("Delete Investigation"),
                                content: Text(
                                    "Do you want to delete current investigation '" +
                                        investigationData['investigation']
                                            ['name'] +
                                        "' ?"),
                                actions: [
                                  CupertinoDialogAction(
                                      child: Text("No"),
                                      onPressed: () {
                                        setState(() {
                                          deleteToggle = false;
                                        });
                                      }),
                                  CupertinoDialogAction(
                                      child: Text("Yes"),
                                      onPressed: () => DeleteInvestigation())
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Stack(children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          deleteToggle = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      AppHeader(
                                          title:
                                              investigationData['investigation']
                                                  ['name'],
                                          includeSearch: true,
                                          goToInvestigations: true),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      UserWidget(
                                          networkId:
                                              investigationData['investigation']
                                                  ['network'],
                                          number:
                                              investigationData['trackingNo']),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.mobile_friendly_outlined,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "IMEI",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    investigationData['imei']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: black
                                                            .withOpacity(0.6)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.sim_card_outlined,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "IMSI",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    investigationData['imsi']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: black
                                                            .withOpacity(0.6)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      CallsWidget(
                                        investigationName:
                                            investigationData['investigation']
                                                ['name'],
                                        investigationId: widget.investigationId,
                                        outgoing: investigationData['outgoing'],
                                        incoming: investigationData['incoming'],
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                      ),
                    )),
    );
  }
}
