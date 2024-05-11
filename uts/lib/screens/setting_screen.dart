// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          color: Colors.indigo,
          size: 64,
        ),
        Center(
          child: Text(
            "Setting Screen",
            style: TextStyle(
                fontSize: 24,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
