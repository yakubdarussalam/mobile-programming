// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Detail"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Profile Detail",
              ),
              Tab(
                text: "Addresses",
              ),
              Tab(
                text: "Followers",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "Profile Detail in View",
                style: TextStyle(color: Colors.indigo, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                "Addresses in Tab View",
                style: TextStyle(color: Colors.indigo, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                "Followers in Tab View",
                style: TextStyle(color: Colors.indigo, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
