import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'email': null, 'password': null};
  final focusPassword = FocusNode();
  var visibilityPassword = false.obs;

  onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.snackbar("Form Data",
          "email : $formData['email'],password: $formData['password']",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Form",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Form"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        child: Image.asset('assets/images/flutter.png')),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required!";
                        }
                        if (!value!.isEmail) {
                          return "Email is invalid!";
                        }
                      },
                      onSaved: (newValue) {
                        formData['email'] = newValue;
                      },
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Obx(() => TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      var visible = visibilityPassword.value;
                                      visibilityPassword(!visible);
                                    },
                                    icon: Icon(visibilityPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            obscureText: visibilityPassword.value,
                            focusNode: focusPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                            },
                            onSaved: (newValue) {
                              formData['password'] = newValue;
                            },
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: onSubmit,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
