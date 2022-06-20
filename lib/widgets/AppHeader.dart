import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:flutter_police_app/pages/search.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool includeSearch;
  final bool goToInvestigations;

  const AppHeader(
      {Key? key,
      required this.title,
      required this.includeSearch,
      required this.goToInvestigations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              goToInvestigations
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecentInvestigations()),
                    )
                  : Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title == "")
              Container(width: 150, child: Image.asset('assets/images/1.png')),
            if (title != "")
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
          ],
        ),
        // if (includeSearch == true)
        //   Align(
        //       alignment: Alignment.centerRight,
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Search()),
        //           );
        //         },
        //         child: Icon(
        //           Icons.search,
        //           size: 30,
        //         ),
        //       ))
      ],
    );
  }
}
