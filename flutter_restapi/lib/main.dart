// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_restapi/login.dart';
import 'package:flutter_restapi/product_controller.dart';
import 'package:flutter_restapi/product_detail.dart';
import 'package:flutter_restapi/product_list.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Flutter RestAPI",
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
