import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';

class UserWidget extends StatelessWidget {
  final int networkId;
  final String number;
  const UserWidget({Key? key, required this.networkId, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (networkId == 0)
                  Image.asset(
                    'assets/images/mobitel_logo.png',
                  ),
                if (networkId == 3)
                  Image.asset(
                    'assets/images/dialog_logo.png',
                  ),
                if (networkId == 1)
                  Image.asset(
                    'assets/images/airtel_logo.png',
                  ),
                if (networkId == 2)
                  Image.asset(
                    'assets/images/hutch_logo.png',
                  ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          double.parse(number).round().toString(),
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: black),
        )
      ],
    );
  }
}
