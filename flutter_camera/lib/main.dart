import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera/video_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var imagePath = "".obs;
  openCamera() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (image == null) {
      imagePath('');
    } else {
      imagePath(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Camera",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter Camera",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: imagePath.value == ''
                        ? Image.asset('assets/images/no_image.png')
                        : Image.file(File(imagePath.value)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    child: ElevatedButton(
                        onPressed: openCamera,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          "Take Picture",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    child: ElevatedButton(
                        onPressed: () async {
                          Get.to(() => VideoPage());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          "Page Video",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
