import 'dart:async';
import 'package:cookuy/constants.dart';
import 'package:cookuy/screens/landing.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landing())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: lightGreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bowl.png",
              height: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text(
              "Cookuy",
              style: TextStyle(
                  fontFamily: 'OpenSans-Bold', color: white, fontSize: 21),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}
