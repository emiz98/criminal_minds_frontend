import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SortWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;

  const SortWidget(
      {Key? key, required this.text1, required this.text2, required this.text3})
      : super(key: key);

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeBgColor: [primary],
      borderColor: [black.withOpacity(0.3)],
      borderWidth: 1.0,
      inactiveBgColor: white,
      customWidths: [90, 90, 120],
      totalSwitches: 3,
      labels: [widget.text1, widget.text2, widget.text3],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
// Scaffold(
//         body: ToggleButtons(
//       fillColor: primary,
//       color: black,
//       selectedColor: white,
//       renderBorder: true,
//       splashColor: Colors.transparent,
//       borderRadius: BorderRadius.circular(20),
//       borderColor: black,
//       selectedBorderColor: primary,
//       children: const <Widget>[
//         Padding(
//           padding: EdgeInsets.only(left: 15, right: 15),
//           child: Text(
//             "Attempts",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 15, right: 15),
//           child: Text(
//             "Duration",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 15, right: 15),
//           child: Text(
//             "Date & Time",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//       onPressed: (int newIndex) {
//         setState(() {
//           for (int index = 0; index < isSelected.length; index++) {
//             if (index == newIndex) {
//               isSelected[index] = true;
//             } else {
//               isSelected[index] = false;
//             }
//           }
//         });
//       },
//       isSelected: isSelected,
//     ));