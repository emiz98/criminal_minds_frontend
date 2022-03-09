import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';

// (1)-Attempts
// (2)-Duration
// (3)-Date & Time

// (1)-Incoming
// (2)-Outgoing
class SingleCall extends StatefulWidget {
  final int WidgetType;
  final int callType;
  const SingleCall({Key? key, required this.WidgetType, required this.callType})
      : super(key: key);

  @override
  State<SingleCall> createState() => _SingleCallState();
}

class _SingleCallState extends State<SingleCall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            widget.callType == 1 ? outgoing_shade : incoming_shade,
            white
          ]),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: secondary_shade)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.WidgetType == 1)
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: Text(
                      "9",
                      style: TextStyle(
                          color: widget.callType == 1 ? outgoing : incoming,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.callType == 1 ? outgoing : incoming,
                            width: 2),
                        color: white,
                        shape: BoxShape.circle),
                  ),
                Icon(
                  widget.callType == 1
                      ? Icons.call_missed_outgoing
                      : Icons.call_missed,
                  color: widget.callType == 1 ? outgoing : incoming,
                  size: 35,
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "076 222 3333",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    if (widget.WidgetType == 1)
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: secondary,
                            size: 16,
                          ),
                          SizedBox(width: 3),
                          Text("Total Duration (15s)",
                              style: TextStyle(color: secondary, fontSize: 12))
                        ],
                      ),
                    if (widget.WidgetType == 2)
                      Row(
                        children: [
                          Text(
                            "IDH Junction",
                            style: TextStyle(color: secondary),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.timer_outlined,
                            color: secondary,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text("15s",
                              style: TextStyle(color: secondary, fontSize: 12))
                        ],
                      ),
                  ],
                ),
              ],
            ),
            if (widget.WidgetType == 2)
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: secondary,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "2021-10-21",
                        style: TextStyle(color: secondary, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: secondary,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "2021-10-21",
                        style: TextStyle(color: secondary, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            // Icon(
            //   Icons.more_vert,
            //   color: secondary,
            // )
          ],
        ),
      ),
    );
  }
}
