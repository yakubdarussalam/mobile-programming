import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Layout",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 136, 194, 241)),
              child: Center(
                child: Text("Content"),
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: double.infinity,
              height: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text("Home")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text("Cart")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text("History")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text("Setting")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 32,
                      ),
                      Text("Profile")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
