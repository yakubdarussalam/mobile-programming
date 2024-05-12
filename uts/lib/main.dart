import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts/screens/home_screen.dart';
import 'package:uts/screens/message_screen.dart';
import 'package:uts/screens/profile_screen.dart';
import 'package:uts/screens/saved_screen.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var screens = [HomeScreen(), MessageScreen(), SavedScreen(), ProfileScreen()];

  var screenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Job Seeker App",
      theme: ThemeData(
        // Define the theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.indigo, // Set selected icon color
          unselectedItemColor: Colors.grey, // Set unselected icon color
        ),
      ),
      home: Obx(
        () => Scaffold(
          body: screens[screenIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: screenIndex.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Message"),
              BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
            onTap: (value) {
              screenIndex(value);
            },
          ),
        ),
      ),
    );
  }
}
