import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});

  final List<Map<String, String>> savedJobs = [
    {
      'title': 'Backend Android Developer',
      'company': 'PT. Bank Central Asia',
      'location': 'Jakarta, Indonesia',
    },
    {
      'title': 'Backend Web Developer',
      'company': 'PT. Bank Republik Indonesia',
      'location': 'Jakarta, Indonesia',
    },
    {
      'title': 'Frontend Web Developer',
      'company': 'PT. Nippon Electric Company',
      'location': 'Jakarta, Indonesia',
    },
    {
      'title': 'AI Engineer',
      'company': 'PT. Mencari Cinta Sejati',
      'location': 'Jakarta, Indonesia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs'),
      ),
      body: savedJobs.isNotEmpty
          ? ListView.builder(
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                final job = savedJobs[index];
                return ListTile(
                  leading: Icon(Icons.work),
                  title: Text(job['title']!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Company: ${job['company']}'),
                      Text('Location: ${job['location']}'),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Action when a saved job is tapped
                  },
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.save,
                    color: Colors.indigo,
                    size: 64,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No saved jobs",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
