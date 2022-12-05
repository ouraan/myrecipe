import 'package:cookuy/constants.dart';
import 'package:cookuy/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterSucess extends StatelessWidget {
  const RegisterSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/gifts.png",
                width: 110, height: 110, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              "Congratulation",
              style: TextStyle(
                  fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              "Your account is complete, please enjoy the\nbest home made food",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  color: lightGrey,
                  fontSize: 16),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Login())));
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
          ],
        ),
      ),
    );
  }
}
