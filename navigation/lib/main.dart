// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:navigation/screens/home_screen.dart';
import 'package:navigation/screens/profile_screen.dart';
import 'package:navigation/screens/setting_screen.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var screens = [HomeScreen(), SettingScreen(), ProfileScreen()];

  var screenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Flutter Navigation",
        home: Obx(
          () => Scaffold(
            body: screens[screenIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: screenIndex.value,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
              onTap: (value) {
                screenIndex(value);
              },
            ),
          ),
        ));
  }
}
