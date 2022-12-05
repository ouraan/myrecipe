import 'package:cookuy/constants.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangeProfile extends StatefulWidget {
  final User user;
  const ChangeProfile({super.key, required this.user});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  bool isPasswordVisible = false;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerConfirmPass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerName.text = widget.user.name;
    controllerEmail.text = widget.user.email;
    controllerPhone.text = widget.user.phone;
    controllerPass.text = widget.user.password;
    super.initState();
  }

  void changePassword(String name, email, password, phone) async {
    try {
      var response = await Dio().put(
          'http://192.168.30.191:8000/api/user/' + widget.user.id.toString(),
          data: {
            "name": name,
            "email": email,
            "password": password,
            "phone": phone
          });
      if (response.data.length > 0) {
        print("Account updated successfully");
        Navigator.pop(context);
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Change Profile",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: semiBlack,
              size: 30,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: Service.fetchUserBasedId(widget.user.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20),
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
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: extraLightGrey)),
                          fillColor: extraLightGrey,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: extraLightGrey, width: 3)),
                          hintText: 'Rizha Alfianita',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: lightGrey,
                              fontSize: 16),
                        ),
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
                          hintText: '08xxxxxxxx',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: lightGrey,
                              fontSize: 16),
                        ),
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
                          hintText: 'rizhaalfianita1412@gmail.com',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: lightGrey,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "New password",
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
                          hintText: '******',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: lightGrey,
                              fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: (() => setState(() =>
                                  isPasswordVisible = !isPasswordVisible)),
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Confirm password",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: semiBlack,
                            fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: controllerConfirmPass,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: extraLightGrey)),
                          fillColor: extraLightGrey,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: extraLightGrey, width: 3)),
                          hintText: '******',
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans-Light',
                              color: lightGrey,
                              fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: (() => setState(() =>
                                  isPasswordVisible = !isPasswordVisible)),
                              icon: isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        obscureText: isPasswordVisible,
                        validator: (value) {
                          if (value != controllerPass.text) {
                            return 'Password enter the same password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            changePassword(
                                controllerName.text,
                                controllerEmail.text,
                                controllerPass.text,
                                controllerPhone.text);
                            // setState(() {
                            //   controllerName.text = "${snapshot.data?[0].name}";
                            //   controllerEmail.text =
                            //       "${snapshot.data?[0].email}";
                            //   controllerPass.text =
                            //       "${snapshot.data?[0].password}";
                            // });
                          }
                        },
                        child: Text(
                          "Save Changes",
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
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
