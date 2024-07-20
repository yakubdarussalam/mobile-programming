// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_uas/controllers/auth_controller.dart';
import 'package:flutter_uas/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      Get.off(MainScreen());
    }
  }

  Future<void> checkToken() async {
    final pref = await SharedPreferences.getInstance();
    var accessToken = pref.getString("access_token");
    if (accessToken != null) {
      Get.off(MainScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    checkToken(); // Add this line to check for token when the screen is built
    return Obx(() => Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/company.png', height: 100),
                Text(
                  "Job Vacancy App",
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
