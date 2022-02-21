import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortInvestigation extends StatefulWidget {
  const SortInvestigation({Key? key}) : super(key: key);

  @override
  _SortInvestigationState createState() => _SortInvestigationState();
}

class _SortInvestigationState extends State<SortInvestigation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            child: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26.withOpacity(1)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            child: Text(
              "Network",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26.withOpacity(1)),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            child: Text(
              "Date & Time",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
