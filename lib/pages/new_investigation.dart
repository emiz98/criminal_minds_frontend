// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/json/colors_json.dart';
import 'package:flutter_police_app/json/utils.dart';
import 'package:flutter_police_app/pages/active_investigation_home.dart';
import 'package:flutter_police_app/widgets/AppHeader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;

class NewInvestigation extends StatefulWidget {
  const NewInvestigation({Key? key}) : super(key: key);

  @override
  _NewInvestigationState createState() => _NewInvestigationState();
}

class _NewInvestigationState extends State<NewInvestigation> {
  final inputController = TextEditingController();
  bool _error = false;
  bool _isInvestigating = false;
  var network = 0;
  String file_path = "";

  createInvestigation() async {
    final String token = await getToken();
    try {
      if (inputController.text == "") {
        setState(() {
          _error = true;
        });
      } else {
        setState(() {
          _error = false;
          _isInvestigating = true;
        });
        var request =
            http.MultipartRequest('POST', Uri.parse(postInvestigation));
        request.headers.addAll({"Authorization": "TOKEN " + token.toString()});
        request.fields["name"] = inputController.text;
        request.fields["network"] = network.toString();
        request.files.add(
            await http.MultipartFile.fromPath('pdf', file_path.toString()));
        var res = await request.send();
        var callbackData = json.decode(await res.stream.bytesToString());
        if (res.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActiveInvestigationHome(
                      investigationId: callbackData['id'].toString(),
                    )),
          );
        } else {
          setState(() {
            _isInvestigating = false;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  uploadPdf() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result == null) return;
    final file = result.files.first;
    setState(() {
      file_path = file.path!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? value = 'Mobitel';
    return SafeArea(
      child: DefaultTextStyle(
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: _isInvestigating
                ? Container(
                    height: size.height - 300,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/lottie/investigating.json"),
                        Text(
                          "Please wait while we analyze the data",
                          style: TextStyle(color: black, fontSize: 15),
                        )
                      ],
                    )),
                  )
                : GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppHeader(
                              title: "",
                              includeSearch: false,
                              goToInvestigations: true),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ToggleSwitch(
                                initialLabelIndex: network,
                                cornerRadius: 20.0,
                                activeBgColor: [primary],
                                borderColor: [black.withOpacity(0.3)],
                                borderWidth: 1.0,
                                inactiveBgColor: white,
                                customWidths: [
                                  size.width / 4,
                                  size.width / 4,
                                  size.width / 4,
                                ],
                                totalSwitches: 3,
                                labels: ["Mobitel", "Airtel", "Hutch"],
                                radiusStyle: true,
                                onToggle: (index) {
                                  network = index!;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                  controller: inputController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primary, width: 1),
                                      ),
                                      border: OutlineInputBorder(),
                                      hintText: 'Investigation Name',
                                      errorText: _error
                                          ? "Please enter a valid name"
                                          : null)),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              file_path != ""
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(500, 45),
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                          primary: primary),
                                      child: Text("Investigate"),
                                      onPressed: () {
                                        createInvestigation();
                                      },
                                    )
                                  : OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(500, 45),
                                        side: BorderSide(
                                            width: 2, color: Colors.black),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                        primary: Colors.black,
                                      ),
                                      onPressed: () => {uploadPdf()},
                                      icon: Icon(
                                          Icons.drive_folder_upload_rounded),
                                      label: const Text(
                                        "Upload Document",
                                      )),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
