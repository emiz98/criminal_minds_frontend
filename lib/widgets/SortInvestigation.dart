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
              border: Border.all(color: Color(0xFFc8210d)),
              color: Color(0xFFc8210d),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            child: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26.withOpacity(1)),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            child: Text(
              "Network",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26.withOpacity(1)),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
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
