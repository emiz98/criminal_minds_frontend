// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login_splash.dart';
import 'package:flutter_police_app/pages/recent_investigations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  String _token = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  getToken() async {
    final storage = FlutterSecureStorage();
    String? storage_token = (await storage.read(key: 'jwt'));
    setState(() {
      if (storage_token != null) {
        _token = storage_token;
      } else {
        _token = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_token == "") {
      return Login_Splash();
    } else {
      return RecentInvestigations();
    }
  }
}
