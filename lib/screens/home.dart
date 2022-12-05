import 'package:cookuy/constants.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/screens/bookmark.dart';
import 'package:cookuy/screens/components/home_body.dart';
import 'package:cookuy/screens/profile.dart';
import 'package:cookuy/screens/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      BodyHome(user: widget.user),
      Search(),
      Bookmark(),
      Profile(
        user: widget.user,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: lightGreen,
        unselectedItemColor: lightGrey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}
