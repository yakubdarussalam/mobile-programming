// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation/screens/profile_detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person,
          color: Colors.indigo,
          size: 64,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile Screen",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(ProfileDetailScreen());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: Text(
                    "Profile Detail Screen",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
