import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:google_fonts/google_fonts.dart';

class NewInvestigation extends StatefulWidget {
  const NewInvestigation({Key? key}) : super(key: key);

  @override
  _NewInvestigationState createState() => _NewInvestigationState();
}

class _NewInvestigationState extends State<NewInvestigation> {
  @override
  Widget build(BuildContext context) {
    String? value = 'Mobitel';
    var items = [
      'Mobitel',
      'Dialog',
      'Airtel',
      'Hutch',
    ];
    return SafeArea(
      child: DefaultTextStyle(
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppHeader(title: ""),
                  Column(
                    children: [
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Investigation Name',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select a network",
                              style: TextStyle(fontSize: 18)),
                          Container(
                            width: 200,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black38, width: 2)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map(BuildMenuItem).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    value = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(500, 45),
                            side: BorderSide(width: 2, color: Colors.black),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                            primary: Colors.black,
                          ),
                          onPressed: () => {},
                          icon: Icon(Icons.drive_folder_upload_rounded),
                          label: Text(
                            "Upload Document",
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(500, 45),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            primary: Colors.red),
                        child: Text("Investigate"),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> BuildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 15),
      ));
}
