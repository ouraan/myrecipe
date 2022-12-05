import 'package:cookuy/constants.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/screens/home.dart';
import 'package:cookuy/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
    try {
      var response = await Dio()
          .get('http://192.168.30.191:8000/api/user/' + email + '/' + password);
      if (response.data.length > 0) {
        int id = response.data[0]['id'];
        String name = response.data[0]['name'];
        String email = response.data[0]['email'];
        String password = response.data[0]['password'];
        String phone = response.data[0]['phone'];

        print("Login success");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      user: User(
                          id: id,
                          name: name,
                          email: email,
                          phone: phone,
                          password: password),
                    )));
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Invalid email or password',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          e.toString(),
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Welcome back",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 26),
              ),
              SizedBox(height: 5),
              Text(
                "Sign-in to your account",
                style: TextStyle(
                    fontFamily: 'OpenSans-Regular',
                    color: darkGrey,
                    fontSize: 16),
              ),
              SizedBox(height: 40),
              Text(
                "Email",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Your email',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerPass,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Your password',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                  suffixIcon: IconButton(
                      onPressed: (() => setState(
                          () => isPasswordVisible = !isPasswordVisible)),
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                ),
                obscureText: isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    login(controllerEmail.text, controllerPass.text);
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      color: white,
                      fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: lightGreen,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        fontFamily: 'OpenSans-Regular',
                        color: darkGrey,
                        fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Regular',
                          color: lightGreen,
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
