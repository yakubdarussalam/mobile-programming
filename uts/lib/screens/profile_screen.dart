// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts/screens/profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollowing = false; // Track follow/unfollow state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Screen",
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Info'),
                Tab(text: 'Account'),
                Tab(text: 'Company'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildInfoTab(),
              buildAccountTab(),
              buildCompanyTab(),
            ],
          ),
        ),
      ),
    );
  }

  // Build content for each tab
  Widget buildInfoTab() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              imageHeader,
              SizedBox(height: 20), // Adjust spacing if needed
              personalInfo,
              Container(
                margin: EdgeInsets.only(bottom: 20), // Add margin bottom of 20
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(ProfileEditScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.indigo,
                  ),
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 280, // Adjust position as needed
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Photos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '150',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '1M',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '50',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountTab() {
    return Column(children: [
      Text(
        "Account Tab",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 38, 67, 67),
        ),
      ),
    ]);
  }

  Widget buildCompanyTab() {
    return Column(children: [
      Text(
        "Company Tab",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 38, 67, 67),
        ),
      ),
    ]);
  }

  final imageHeader = Container(
    width: double.infinity,
    height: 320,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 64,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(height: 10),
        Text(
          "Mr. Waduh",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 38, 67, 67),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Content Creator And Meme Artist",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(222, 81, 115, 117),
          ),
        ),
      ],
    ),
  );

  final personalInfo = Container(
    margin: EdgeInsets.all(54),
    child: Column(
      children: [
        SizedBox(height: 24),
        Row(
          children: const [
            Icon(
              Icons.mail,
              color: Colors.indigo,
            ),
            SizedBox(width: 15),
            Text("waduh@example.com"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: const [
            Icon(
              Icons.phone_android,
              color: Colors.indigo,
            ),
            SizedBox(width: 15),
            Text("+62 02101219129"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: const [
            Icon(
              Icons.group_add,
              color: Colors.indigo,
            ),
            SizedBox(width: 15),
            Text("Add to Group"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: const [
            Icon(
              Icons.location_city,
              color: Colors.indigo,
            ),
            SizedBox(width: 15),
            Text("France"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: const [
            Icon(
              Icons.comment,
              color: Colors.indigo,
            ),
            SizedBox(width: 15),
            Text("Show all Comments"),
          ],
        ),
      ],
    ),
  );

  final numberInfo = Container(
    height: 100,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          offset: Offset(2, 4),
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Photos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '150',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Followers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1M',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Following',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '50',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void main() {
  runApp(ProfileScreen());
}
