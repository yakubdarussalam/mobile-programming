import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});
  final List<String> bulan = const [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter List",
      home: Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(bulan[index], style: TextStyle(fontSize: 30)),
              ),
            );
          },
          separatorBuilder: (context, position) {
            return Container(
              color: Colors.grey,
              child: const Text('Ini contoh separator Builder',
                  style: TextStyle(fontSize: 15)),
            );
          },
          itemCount: bulan.length,
        ),
      ),
    );
  }
}
