// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_restapi/auth_controller.dart';
import 'package:flutter_restapi/product_list.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    final Map<String, dynamic> payload = {
      "email": emailController.text,
      "password": passwordController.text
    };
    await controller.login(payload);
    if (controller.isLoggedIn.value) {
      Get.off(ProductList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Silahkan Login untuk membuat Session",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    controller.message.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Text(
                        "Signin",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
