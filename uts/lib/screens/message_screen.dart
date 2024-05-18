import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> dummyChats = [
    {
      'sender': 'Alice',
      'message': 'Hey, We are interested to your profile?',
      'time': '10:30 AM',
    },
    {
      'sender': 'Bob',
      'message': 'Are we still on for today?',
      'time': '11:00 AM',
    },
    {
      'sender': 'Charlie',
      'message': 'Can you send me the report?',
      'time': '12:15 PM',
    },
    {
      'sender': 'Dave',
      'message': 'Meeting is rescheduled to 3 PM.',
      'time': '1:45 PM',
    },
    {
      'sender': 'Eve',
      'message': 'Happy Birthday!',
      'time': '2:30 PM',
    },
    {
      'sender': 'Frank',
      'message': 'Let’s catch up sometime.',
      'time': '3:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: dummyChats.isNotEmpty
          ? ListView.builder(
              itemCount: dummyChats.length,
              itemBuilder: (context, index) {
                final chat = dummyChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(chat['sender']![
                        0]), // Display the first letter of the sender's name
                  ),
                  title: Text(chat['sender']!),
                  subtitle: Text(chat['message']!),
                  trailing: Text(chat['time']!),
                  onTap: () {
                    // Action when a chat is tapped
                  },
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.indigo,
                    size: 64,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No messages yet",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Action when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                    child: Text(
                      'Compose Message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MessageScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
