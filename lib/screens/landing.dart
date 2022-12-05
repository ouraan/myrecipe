import 'package:cookuy/constants.dart';
import 'package:cookuy/screens/login.dart';
import 'package:cookuy/screens/register.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/bowl_green.png",
                    height: 21, fit: BoxFit.cover),
                SizedBox(width: 10),
                Text(
                  "Cookuy",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: semiBlack,
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/plate.png",
                height: 265, fit: BoxFit.cover),
            Text(
              "Make your own\nfoods",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "Let food be thy medicine and medicine\nbe thy food.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  color: lightGrey,
                  fontSize: 16),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontFamily: 'OpenSans-SemiBold',
                    color: white,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  primary: lightGreen,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: 'OpenSans-SemiBold',
                    color: lightGreen,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  primary: extraLightGreen,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
