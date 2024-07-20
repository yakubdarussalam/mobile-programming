import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_uas/controllers/saved_job_controller.dart';

class SavedDetailScreen extends StatelessWidget {
  final int jobId;

  SavedDetailScreen({required this.jobId});

  final SavedJobController savedJobController = Get.find<SavedJobController>();

  @override
  Widget build(BuildContext context) {
    final job =
        savedJobController.savedJobs.firstWhere((job) => job.id == jobId);

    void deleteJob() async {
      bool success = await savedJobController.deleteSavedJob(jobId);
      if (success) {
        Get.back();
        Get.snackbar('Success', 'Job has been deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete the job');
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80), // Menambahkan margin atas
                height: 220, // Menyesuaikan tinggi gambar
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
                    Text(
                      "Date: ${job.date}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
              onPressed: deleteJob,
              child: Text("Delete",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
