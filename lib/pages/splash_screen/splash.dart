// ignore_for_file: camel_case_types

import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_police_app/pages/login/login_splash.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // Re routing to login splash screen after main splsah screen
  @override
  void initState() {
    super.initState();
    navigateToSplashScreen();
  }

  navigateToSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => const Login_Splash()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            splash_body(size: size),
          ],
        ),
      ),
    );
  }
}

class splash_body extends StatelessWidget {
  const splash_body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        DropShadowImage(
          image: Image.asset(
            'assets/images/1.png',
            width: size.width * 0.7,
            height: size.height * 0.7,
          ),
          borderRadius: 5,
          blurRadius: 5,
          offset: const Offset(2, 2),
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.modulate),
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/shield.png',
              width: size.width * 0.35,
              height: size.height * 0.35,
            ),
          ),
        ),
      ],
    );
  }
}
