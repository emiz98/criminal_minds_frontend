import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';

class SingleInvestigationWidget extends StatelessWidget {
  final String title;
  final int network;
  final String date;
  final String time;

  const SingleInvestigationWidget(
      {Key? key,
      required this.title,
      required this.network,
      required this.date,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26.withOpacity(0.2)),
            color: black.withOpacity(0.1),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black38,
            //     blurRadius: 3,
            //     spreadRadius: 0.1,
            //     offset: Offset(
            //       2,
            //       2,
            //     ),
            //   )
            // ],
            // gradient: LinearGradient(colors: [
            //   if (network == 1) Colors.blue.shade300,
            //   if (network == 2) Colors.pink.shade300,
            //   if (network == 3) Colors.orange.shade400,
            //   if (network == 4) Colors.red.shade300,
            //   Colors.white,
            // ]),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black87.withOpacity(0.6),
                            size: 12,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.6),
                                fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black87.withOpacity(0.6),
                            size: 12,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.6),
                                fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  if (network == 1)
                    Container(
                        height: 30,
                        child: Image.asset(
                          'assets/images/mobitel_logo.png',
                        )),
                  if (network == 2)
                    Container(
                        height: 30,
                        child: Image.asset(
                          'assets/images/dialog_logo.png',
                        )),
                  if (network == 3)
                    Container(
                        height: 30,
                        child: Image.asset(
                          'assets/images/hutch_logo.png',
                        )),
                  if (network == 4)
                    Container(
                        height: 30,
                        child: Image.asset(
                          'assets/images/airtel_logo.png',
                        ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
