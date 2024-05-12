import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'), // Judul AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              color: Colors.indigo,
              size: 64,
            ),
            SizedBox(height: 20), // Berikan jarak antara ikon dan teks
            Text(
              "No messages yet", // Teks penjelasan
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Berikan jarak sebelum tombol
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Warna latar belakang tombol
              ),
              child: Text(
                'Compose Message',
                style: TextStyle(color: Colors.white),
              ), // Teks tombol
            ),
          ],
        ),
      ),
    );
  }
}
