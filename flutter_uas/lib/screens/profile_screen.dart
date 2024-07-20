// profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_uas/screens/login_screen.dart';
import 'package:flutter_uas/screens/profile_edit_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_uas/controllers/user_controller.dart';
import 'package:flutter_uas/models/user_model.dart';
import 'package:flutter_uas/controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
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
                    Tab(text: 'Data'),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  _buildInfoTab(controller.user),
                  _buildAccountTab(),
                  _buildDataTab(),
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  Widget _buildInfoTab(User user) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              _imageHeader(user),
              SizedBox(height: 20),
              _personalInfo(user),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.to(() => ProfileEditScreen(user: user));
                    controller.getUser(user.id); // Refresh user data after edit
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
            top: 280,
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
                    children: [
                      Text(
                        'Connection',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${user.connection}',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Work Experience',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${user.experience} Years',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.status,
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 14,
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

  Widget _buildAccountTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 38, 67, 67),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Edit Profile"),
          onTap: () async {
            await Get.to(() => ProfileEditScreen(user: controller.user));
            controller
                .getUser(controller.user.id); // Refresh user data after edit
          },
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Change Password"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text("Language"),
          onTap: () {},
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () async {
              await authController.logout();
              Get.offAll(LoginScreen());
            },
            child: Text('Sign Out'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Full width button
              shadowColor: Colors.red, // Button color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Data",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 38, 67, 67),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text("Work Experience"),
            subtitle: Text("2 years as Software Engineer"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text("Education"),
            subtitle: Text("Bachelor's Degree in Computer Science"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Certified"),
            subtitle: Text("AWS Certified Developer"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Skills"),
            subtitle: Text("Flutter, Dart, Firebase, UI/UX Design"),
            onTap: () {},
          ),
          // Add more data content here...
        ],
      ),
    );
  }

  Widget _imageHeader(User user) {
    return Container(
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
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(user.image),
          ),
          SizedBox(height: 10),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 38, 67, 67),
            ),
          ),
          SizedBox(height: 10),
          Text(
            user.position,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(222, 81, 115, 117),
            ),
          ),
        ],
      ),
    );
  }

  Widget _personalInfo(User user) {
    return Container(
      margin: EdgeInsets.all(54),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.indigo,
              ),
              SizedBox(width: 15),
              Text(user.email),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.phone_android,
                color: Colors.indigo,
              ),
              SizedBox(width: 15),
              Text(user.phone),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.location_city,
                color: Colors.indigo,
              ),
              SizedBox(width: 15),
              Text(user.address),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: Colors.indigo,
              ),
              SizedBox(width: 15),
              Text("${user.age} Years Old"),
            ],
          ),
        ],
      ),
    );
  }
}
