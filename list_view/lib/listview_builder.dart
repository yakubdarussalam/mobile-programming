import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(bulan[index], style: TextStyle(fontSize: 30)),
              ),
            );
          },
          itemCount: bulan.length,
        ),
      ),
    );
  }
}
