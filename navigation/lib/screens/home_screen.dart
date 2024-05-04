// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.home,
          color: Colors.indigo,
          size: 64,
        ),
        Center(
          child: Text(
            'Home Screen',
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
