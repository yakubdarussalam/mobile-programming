// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view/listview_builder.dart';
import 'package:list_view/listview_constructor.dart';
import 'package:list_view/listview_separated.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Widget> screens = [
    ListViewConstructor(),
    ListViewBuilder(),
    ListViewSeparated()
  ];

  var screenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Flutter ListView",
        debugShowCheckedModeBanner: false,
        home: Obx(
          () => Scaffold(
            appBar: AppBar(
              title: const Text("Flutter ListView"),
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: screens[screenIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: screenIndex.value,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contacts), label: "Contact"),
              ],
              onTap: (value) {
                screenIndex.value = value;
              },
            ),
          ),
        ));
  }
}
