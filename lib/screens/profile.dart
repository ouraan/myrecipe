import 'package:cookuy/constants.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/screens/change_profile.dart';
import 'package:cookuy/screens/login.dart';
import 'package:cookuy/screens/my_recipe.dart';
import 'package:cookuy/services/services.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
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
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      height: 83,
                      width: 83,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${snapshot.data?[0].email}",
                      style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          color: lightGrey,
                          fontSize: 17),
                    ),
                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeProfile(
                                      user: User(
                                          id: int.parse(
                                              "${snapshot.data?[0].id}"),
                                          name: "${snapshot.data?[0].name}",
                                          email: "${snapshot.data?[0].email}",
                                          phone: "${snapshot.data?[0].phone}",
                                          password:
                                              "${snapshot.data?[0].password}"),
                                    )));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: extraLightGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Profile settings",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: lightGrey,
                                    fontSize: 15),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: lightGrey,
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyRecipe(
                                      user: User(
                                          id: int.parse(
                                              "${snapshot.data?[0].id}"),
                                          name: "${snapshot.data?[0].name}",
                                          email: "${snapshot.data?[0].email}",
                                          phone: "${snapshot.data?[0].phone}",
                                          password:
                                              "${snapshot.data?[0].password}"),
                                    )));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: extraLightGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Recipe",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: lightGrey,
                                    fontSize: 15),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: lightGrey,
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: extraLightGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Log out",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Regular',
                                    color: lightGrey,
                                    fontSize: 15),
                              ),
                              Icon(
                                Icons.logout,
                                color: lightGrey,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
