import 'package:cookuy/constants.dart';
import 'package:cookuy/screens/login.dart';
import 'package:cookuy/screens/register_success.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  void register(String name, email, password, phone) async {
    try {
      var response = await Dio().post('http://192.168.30.191:8000/api/user',
          data: {
            "name": name,
            "email": email,
            "password": password,
            "phone": phone
          });
      if (response.data.length > 0) {
        print("Account created successfully");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterSucess()));
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: semiBlack,
                      fontSize: 26),
                ),
                SizedBox(height: 5),
                Text(
                  "Create account and choose favorite recipe",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Regular',
                      color: darkGrey,
                      fontSize: 16),
                ),
                SizedBox(height: 40),
                Text(
                  "Name",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: semiBlack,
                      fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: extraLightGrey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: extraLightGrey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: extraLightGrey, width: 3)),
                    hintText: 'Your name',
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
                        borderSide:
                            BorderSide(color: extraLightGrey, width: 3)),
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
                        borderSide:
                            BorderSide(color: extraLightGrey, width: 3)),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                  obscureText: isPasswordVisible,
                ),
                SizedBox(height: 20),
                Text(
                  "Phone",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: semiBlack,
                      fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controllerPhone,
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: extraLightGrey)),
                    fillColor: extraLightGrey,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: extraLightGrey, width: 3)),
                    hintText: 'Your phone',
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
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      register(controllerName.text, controllerEmail.text,
                          controllerPass.text, controllerPhone.text);
                    }
                  },
                  child: Text(
                    "Register",
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
                      "Have an account?",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Regular',
                          color: darkGrey,
                          fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign In",
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
      ),
    );
  }
}
