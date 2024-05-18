import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Vacancies',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> jobVacancies = [
    {
      'title': 'Fullstack Android Developer',
      'company': 'PT. Pertamina',
      'workMethod': 'WFH',
      'salary': '\$3000 - \$4000',
      'postingDate': 'Posted 2 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'Backend Android Developer',
      'company': 'PT. Bank Central Asia',
      'workMethod': 'WFO',
      'salary': '\$4000 - \$5000',
      'postingDate': 'Posted 5 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'Backend Web Developer',
      'company': 'PT. Bank Republik Indonesia',
      'workMethod': 'WFO',
      'salary': '\$4000 - \$5000',
      'postingDate': 'Posted 5 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'Frontend Web Developer',
      'company': 'PT. Nippon Electric Company',
      'workMethod': 'WFO',
      'salary': '\$4000 - \$5000',
      'postingDate': 'Posted 5 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'IT Support',
      'company': 'PT. Metrodata Indonesia',
      'workMethod': 'WFO',
      'salary': '\$2000 - \$3000',
      'postingDate': 'Posted 7 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'AI Engineer',
      'company': 'PT. Mencari Cinta Sejati',
      'workMethod': 'WFO',
      'salary': '\$1000 - \$3000',
      'postingDate': 'Posted 7 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
    {
      'title': 'Sales Engineer',
      'company': 'PT. Telkom Indonesia',
      'workMethod': 'WFO',
      'salary': '\$5000 - \$6000',
      'postingDate': 'Posted 8 days ago',
      'location': 'Jakarta, Indonesia',
      'companyIcon': 'assets/images/company.png',
    },
  ];

  bool isJobScreenVisible = false;
  Map<String, dynamic>? selectedJob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Vacancies'),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.all(16.0),
            itemCount: jobVacancies.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      jobVacancies[index]['companyIcon'],
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      jobVacancies[index]['title']!,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company: ${jobVacancies[index]['company']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Work Method: ${jobVacancies[index]['workMethod']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Salary: ${jobVacancies[index]['salary']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Posting Date: ${jobVacancies[index]['postingDate']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Location: ${jobVacancies[index]['location']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  setState(() {
                    isJobScreenVisible = true;
                    selectedJob = jobVacancies[index];
                  });
                },
              );
            },
          ),
          if (isJobScreenVisible)
            JobScreen(
              jobVacancy: selectedJob!,
              onClose: () {
                setState(() {
                  isJobScreenVisible = false;
                  selectedJob = null;
                });
              },
            ),
        ],
      ),
    );
  }
}

class JobScreen extends StatelessWidget {
  final Map<String, dynamic> jobVacancy;
  final VoidCallback onClose;

  const JobScreen({required this.jobVacancy, required this.onClose, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text(jobVacancy['title']),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onClose,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company: ${jobVacancy['company']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Location: ${jobVacancy['location']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Salary: ${jobVacancy['salary']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Work Method: ${jobVacancy['workMethod']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Posting Date: ${jobVacancy['postingDate']}',
                  style: TextStyle(fontSize: 16),
                ),
                // Add more details as needed...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
