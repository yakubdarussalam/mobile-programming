// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});
  var videoPath = ''.obs;

  var controller = Rx<VideoPlayerController?>(null);

  openCamera() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (video == null) {
      videoPath('');
    } else {
      videoPath(video.path);
      controller.value = VideoPlayerController.file(File(video.path));
      await controller.value!.initialize();
      await controller.value!.setLooping(true);
      await controller.value!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Video",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() => Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: videoPath.value == ''
                      ? Image.asset('assets/images/no_video.png')
                      : VideoPlayer(controller.value!),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: openCamera,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        'Record Video',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
