import 'package:flutter/material.dart';
import 'package:flutter_uas/screens/saved_detail_screen.dart';
import 'package:flutter_uas/controllers/saved_job_controller.dart';
import 'package:get/get.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});

  final SavedJobController savedJobController = Get.put(SavedJobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs'),
      ),
      body: Obx(
        () => savedJobController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : savedJobController.savedJobs.isNotEmpty
                ? ListView.builder(
                    itemCount: savedJobController.savedJobs.length,
                    itemBuilder: (context, index) {
                      final job = savedJobController.savedJobs[index];
                      return ListTile(
                        leading: Icon(Icons.work),
                        title: Text(job.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Company: ${job.company}'),
                            Text('Location: ${job.location}'),
                            Text('Date: ${job.date}'), // Menampilkan date
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Get.to(SavedDetailScreen(jobId: job.id));
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
      ),
    );
  }
}
