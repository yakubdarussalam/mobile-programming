import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts/screens/home_screen.dart';
import 'package:uts/screens/message_screen.dart';
import 'package:uts/screens/profile_screen.dart';
import 'package:uts/screens/saved_screen.dart';

void main(List<String> args) {
  runApp(jobSeekerApp());
}

class jobSeekerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Job Seeker App",
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.indigo, // Set selected icon color
          unselectedItemColor: Colors.grey, // Set unselected icon color
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == '123') {
      Get.off(MainApp()); // Redirect to MainApp
    } else {
      Get.snackbar('Error', 'Username or password is incorrect',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/company.png', height: 100), // Logo image
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var screens = [HomeScreen(), MessageScreen(), SavedScreen(), ProfileScreen()];

  var screenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: screens[screenIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          onTap: (value) {
            screenIndex(value);
          },
        ),
      ),
    );
  }
}
