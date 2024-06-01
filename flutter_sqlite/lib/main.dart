// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_sqlite/contact.dart';
import 'package:flutter_sqlite/contactdataaccess.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ContactDataAccess dataAccess = ContactDataAccess();
  List<Contact> list = <Contact>[].obs;

  loadData() async {
    var contacts = await dataAccess.getAll();
    list.clear();
    list.addAll(contacts);
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter SQLite",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter SQLite"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Obx(() => ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var contact = list[index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                    trailing: Text(contact.email),
                  );
                },
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dataAccess.insert(Contact(
                id: 0,
                name: "Budi",
                email: "budi@gmail.com",
                phone: "08122323132"));
            loadData();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
