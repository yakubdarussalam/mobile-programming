// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_uas/screens/login_screen.dart';
// import 'package:flutter_uas/home_screen.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Job Seeker App",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.indigo, // Set selected icon color
          unselectedItemColor: Colors.grey, // Set unselected icon color
        ),
      ),
    );
  }
}
