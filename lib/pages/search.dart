import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:flutter_police_app/widgets/SearchResult.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: GoogleFonts.montserrat(textStyle: TextStyle(color: black)),
          child: Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  AppHeader(
                      title: "New Investigation",
                      includeSearch: true,
                      goToInvestigations: false),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: searchController,
                    onChanged: (text) {
                      Future.delayed(const Duration(seconds: 3), () {});
                    },
                    style: TextStyle(color: black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: black.withOpacity(0.4), width: 2)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 30,
                      ),
                      suffixIcon: searchController.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.grey,
                                size: 30,
                              ),
                              onPressed: () => searchController.clear(),
                            ),
                      hintText: "Search Text",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SearchResult(count: 9, number: "076 222 3333"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SearchResult(count: 4, number: "076 555 5465"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SearchResult(count: 2, number: "076 654 6548"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
