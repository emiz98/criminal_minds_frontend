// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/pages/all_calls.dart';
import 'package:flutter_police_app/widgets/SingleCall.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CallsWidget extends StatefulWidget {
  final String investigationName;
  final String investigationId;
  final List outgoing;
  final List incoming;
  const CallsWidget(
      {Key? key,
      required this.investigationName,
      required this.investigationId,
      required this.outgoing,
      required this.incoming})
      : super(key: key);

  @override
  State<CallsWidget> createState() => _CallsWidgetState();
}

class _CallsWidgetState extends State<CallsWidget> {
  var _toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleSwitch(
          borderColor: [black.withOpacity(0.2)],
          borderWidth: 1,
          minWidth: MediaQuery.of(context).size.width - 220,
          initialLabelIndex: _toggleIndex,
          cornerRadius: 5,
          activeFgColor: black,
          inactiveBgColor: white,
          inactiveFgColor: black,
          totalSwitches: 2,
          labels: ['Outgoing', 'Incoming'],
          customTextStyles: [
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ],
          customIcons: [
            Icon(
              Icons.call_missed_outgoing,
              size: 26,
              color: Colors.green,
            ),
            Icon(
              Icons.call_missed,
              size: 26,
              color: Colors.red,
            ),
          ],
          activeBgColors: [
            [Colors.green.withOpacity(0.5)],
            [Colors.red.withOpacity(0.5)]
          ],
          onToggle: (index) {
            setState(() {
              _toggleIndex = index!;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _toggleIndex == 0
                ? const Text(
                    "Most Outgoing",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                : const Text(
                    "Most Incoming",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalls(
                            call_type: _toggleIndex,
                            investigationId: widget.investigationId,
                            investigationName: widget.investigationName,
                          )),
                );
              },
              child: Row(
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
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        (widget.outgoing.isEmpty && _toggleIndex == 0) ||
                (widget.incoming.isEmpty && _toggleIndex == 1)
            ? Column(
                children: [
                  SizedBox(
                      height: 200,
                      child: Lottie.asset(
                        "assets/lottie/notfound.json",
                        reverse: true,
                      )),
                  Text(
                    "No data found",
                  )
                ],
              )
            : LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    Column(
                        children: List.generate(
                      _toggleIndex == 0
                          ? widget.outgoing.length > 5
                              ? 5
                              : widget.outgoing.length
                          : widget.incoming.length > 5
                              ? 5
                              : widget.incoming.length,
                      (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: SingleCall(
                            WidgetType: 1,
                            callType: _toggleIndex,
                            number: _toggleIndex == 0
                                ? widget.outgoing[index]['receiver']
                                : widget.incoming[index]['receiver'],
                            count: _toggleIndex == 0
                                ? widget.outgoing[index]['count']
                                : widget.incoming[index]['count'],
                            duration: _toggleIndex == 0
                                ? widget.outgoing[index]['duration']
                                : widget.incoming[index]['duration'],
                            date_time: "",
                          )),
                    ))
                  ],
                );
              }),
      ],
    );
  }
}
