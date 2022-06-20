import 'package:flutter/cupertino.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/CallsWidget.dart';
import 'package:flutter_police_app/widgets/UserWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ActiveInvSingle extends StatefulWidget {
  const ActiveInvSingle({Key? key}) : super(key: key);

  @override
  State<ActiveInvSingle> createState() => _ActiveInvSingleState();
}

class _ActiveInvSingleState extends State<ActiveInvSingle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(color: black),
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                AppHeader(
                  title: "New Investigation",
                  includeSearch: true,
                  goToInvestigations: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserWidget(networkId: 1, number: "071 555 5555"),
                    SizedBox(
                        width: 120,
                        child: Lottie.asset('assets/images/connection.json')),
                    UserWidget(networkId: 2, number: "076 544 6548"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CallsWidget(
                  investigationName: "",
                  investigationId: 1.toString(),
                  outgoing: [],
                  incoming: [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
