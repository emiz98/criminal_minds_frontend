import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/SingleCall.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AllCalls extends StatefulWidget {
  final int call_type;
  final String investigationId;
  final String investigationName;
  const AllCalls(
      {Key? key,
      required this.call_type,
      required this.investigationId,
      required this.investigationName})
      : super(key: key);

  @override
  State<AllCalls> createState() => _AllCallsState();
}

class _AllCallsState extends State<AllCalls> {
  @override
  void initState() {
    load();
  }

  late Map<String, dynamic> investigationData;
  bool loading = true;
  var _toggleIndex = 0;

  load() async {
    final String token = await getToken();
    final response = await http.get(
        Uri.parse(getInvestigationDataAdditional +
            widget.call_type.toString() +
            "/" +
            widget.investigationId.toString()),
        headers: {"Authorization": "TOKEN " + token.toString()});

    setState(() {
      Map<String, dynamic> investigationDataDecode = json.decode(response.body);
      investigationData = investigationDataDecode;
      loading = false;
      // print(investigationData['date_time'][0]['created_at']);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      title: widget.investigationName,
                      includeSearch: true,
                      goToInvestigations: false),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.call_type == 0
                        ? "All Outgoing Calls"
                        : "All Incoming Calls",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: _toggleIndex,
                    cornerRadius: 20.0,
                    activeBgColor: [primary],
                    borderColor: [black.withOpacity(0.3)],
                    borderWidth: 1.0,
                    inactiveBgColor: white,
                    customWidths: [90, 90, 120],
                    totalSwitches: 3,
                    labels: ["Attempts", "Duration", "Date & Time"],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        _toggleIndex = index!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (_toggleIndex == 0 && !loading) ...[
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              investigationData['attempts'].length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: SingleCall(
                                      WidgetType: 1,
                                      callType: widget.call_type,
                                      count: investigationData['attempts']
                                          [index]['count'],
                                      number: investigationData['attempts']
                                          [index]['receiver'],
                                      duration: investigationData['attempts']
                                          [index]['duration'],
                                      date_time: "",
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ] else if (_toggleIndex == 1 && !loading) ...[
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              investigationData['duration'].length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: SingleCall(
                                      WidgetType: 2,
                                      callType: widget.call_type,
                                      count: investigationData['duration']
                                          [index]['count'],
                                      number: investigationData['duration']
                                          [index]['receiver'],
                                      duration: investigationData['duration']
                                          [index]['duration'],
                                      date_time: "",
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ] else if (_toggleIndex == 2 && !loading) ...[
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              investigationData['date_time'].length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: SingleCall(
                                      WidgetType: 3,
                                      callType: widget.call_type,
                                      count: 0,
                                      number: investigationData['date_time']
                                          [index]['receiver'],
                                      duration: investigationData['date_time']
                                          [index]['duration'],
                                      date_time: investigationData['date_time']
                                          [index]['created_at'],
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ] else if (loading) ...[
                    Container(
                      height: size.height - 300,
                      child: Center(
                          child: Lottie.asset("assets/lottie/loader.json")),
                    )
                  ]
                ],
              )),
        ),
      ),
    );
  }
}
