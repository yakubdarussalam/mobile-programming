import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_uas/controllers/saved_job_controller.dart';
import 'package:flutter_uas/models/saved_job_model.dart';
import 'package:flutter_uas/controllers/job_controller.dart';
import 'package:intl/intl.dart';
import 'map_screen.dart';

class JobDetailScreen extends StatelessWidget {
  final job;

  const JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    final SavedJobController savedJobController = Get.put(SavedJobController());
    final JobController jobController = Get.put(JobController());
    void applyForJob() async {
      String currentDate = DateFormat('MMMM d, y').format(DateTime.now());
      savedJobController.savedJob = SavedJob(
        id: job.id,
        name: job.name,
        company: job.company,
        location: job.location,
        description: job.description,
        image: job.image,
        date: currentDate,
      );

      bool success = await savedJobController.insertSavedJob();
      if (success) {
        Get.back();
        Get.snackbar('Success', 'Job has been saved successfully');
      } else {
        Get.snackbar('Error', 'Failed to save the job');
      }
    }

    void openMapScreen() async {
      try {
        var fetchedJob = await jobController.getJob(job.id);
        Get.to(() => MapScreen(job: fetchedJob));
      } catch (e) {
        Get.snackbar('Error', 'Failed to fetch job details');
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                height: 220,
                width: double.infinity,
                child: Image.network(
                  job.image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      job.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Company: ${job.company}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Location: ${job.location}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 16),
                    Text(
                      job.description,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 16),
                    IconButton(
                      icon: Icon(Icons.map, color: Colors.blue),
                      onPressed: openMapScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: const Color.fromARGB(255, 119, 119, 119)),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Positioned(
            bottom: 16,
            left: 45,
            right: 45,
            child: ElevatedButton(
              onPressed: applyForJob,
              child: Text("Apply",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
