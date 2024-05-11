// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> bulan = const [
    "Artikel 1",
    "Artikel 2",
    "Artikel 3",
    "Artikel 4",
    "Artikel 5",
    "Artikel 6",
    "Artikel 7",
    "Artikel 8",
    "Artikel 9",
    "Artikel 10",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter List",
      home: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(bulan[index], style: TextStyle(fontSize: 30)),
              ),
            );
          },
          itemCount: bulan.length,
        ),
      ),
    );
  }
}
