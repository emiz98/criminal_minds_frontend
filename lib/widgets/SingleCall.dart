import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/pages/active_inv_single.dart';

// (1)-Attempts
// (2)-Duration
// (3)-Date & Time

// (0)-Outgoing
// (1)-Incoming
class SingleCall extends StatefulWidget {
  final int WidgetType;
  final int callType;
  final String number;
  final int count;
  final int duration;
  final String date_time;

  const SingleCall(
      {Key? key,
      required this.WidgetType,
      required this.callType,
      required this.number,
      required this.count,
      required this.duration,
      required this.date_time})
      : super(key: key);

  @override
  State<SingleCall> createState() => _SingleCallState();
}

class _SingleCallState extends State<SingleCall> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   widget.callType == 1 ? outgoing_shade : incoming_shade,
            //   white
            // ]),
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
                        widget.count.toString(),
                        style: TextStyle(
                            color: widget.callType == 0 ? outgoing : incoming,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: widget.callType == 0 ? outgoing : incoming,
                              width: 2),
                          color: white,
                          shape: BoxShape.circle),
                    ),
                  Icon(
                    widget.callType == 0
                        ? Icons.call_missed_outgoing
                        : Icons.call_missed,
                    color: widget.callType == 0 ? outgoing : incoming,
                    size: 35,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.number,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
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
                            Text("Total Duration (",
                                style:
                                    TextStyle(color: secondary, fontSize: 12)),
                            Text(
                                widget.duration > 60
                                    ? (widget.duration / 60)
                                            .round()
                                            .toString() +
                                        "m " +
                                        (widget.duration % 60)
                                            .round()
                                            .toString() +
                                        "s)"
                                    : widget.duration.toString() + "s)",
                                style:
                                    TextStyle(color: secondary, fontSize: 12))
                          ],
                        ),
                      if (widget.WidgetType == 2)
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: secondary,
                              size: 16,
                            ),
                            SizedBox(width: 2),
                            Text("Duration (",
                                style:
                                    TextStyle(color: secondary, fontSize: 12)),
                            Text(
                                widget.duration > 60
                                    ? (widget.duration / 60)
                                            .round()
                                            .toString() +
                                        "m " +
                                        (widget.duration % 60)
                                            .round()
                                            .toString() +
                                        "s)"
                                    : widget.duration.toString() + "s)",
                                style:
                                    TextStyle(color: secondary, fontSize: 12))
                          ],
                        ),
                    ],
                  ),
                ],
              ),
              if (widget.WidgetType == 3)
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.date_time.substring(0, 10),
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
                            widget.date_time.substring(11, 19),
                            style: TextStyle(color: secondary, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
