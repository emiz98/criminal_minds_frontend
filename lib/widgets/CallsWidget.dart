import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/pages/all_calls.dart';
import 'package:flutter_police_app/widgets/SingleCall.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CallsWidget extends StatefulWidget {
  const CallsWidget({Key? key}) : super(key: key);

  @override
  State<CallsWidget> createState() => _CallsWidgetState();
}

class _CallsWidgetState extends State<CallsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ToggleSwitch(
          borderColor: [black.withOpacity(0.2)],
          borderWidth: 1,
          minWidth: MediaQuery.of(context).size.width - 220,
          initialLabelIndex: 0,
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
            print('switched to: $index');
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Most Incoming",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCalls()),
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
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SingleCall(WidgetType: 1, callType: 1),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SingleCall(WidgetType: 1, callType: 1),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SingleCall(WidgetType: 1, callType: 1),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SingleCall(WidgetType: 1, callType: 1),
        ),
      ],
    );
  }
}
