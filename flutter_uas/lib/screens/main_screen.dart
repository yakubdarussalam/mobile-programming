import 'package:flutter/material.dart';
import 'package:flutter_uas/screens/home_screen.dart';
import 'package:flutter_uas/screens/message_screen.dart';
import 'package:flutter_uas/screens/profile_screen.dart';
import 'package:flutter_uas/screens/saved_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // , MessageScreen(), SavedScreen(), ProfileScreen()
  var screens = [HomeScreen(), MessageScreen(), SavedScreen(), ProfileScreen()];

  var screenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: screens[screenIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          onTap: (value) {
            screenIndex(value);
          },
        ),
      ),
    );
  }
}
