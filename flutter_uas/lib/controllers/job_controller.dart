import 'dart:convert';
import 'package:flutter_uas/models/job_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobController extends GetxController {
  var isLoading = false.obs;
  final String url = "http://10.0.2.2:3000";
  List<Job> jobs = <Job>[].obs;
  late Job job;

  late SharedPreferences pref;

  @override
  void onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
    await getJobs();
  }

  refreshJob() async {
    jobs.clear();
    await getJobs();
  }

  getJobs() async {
    try {
      isLoading(true);
      final headers = createHeaders();
      final response = await http.get(Uri.parse("$url/jobs"), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        jobs = List<Job>.from(data['data'].map((item) => Job.fromMap(item)));
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Job> getJob(int id) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("$url/jobs/$id"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Job data fetched: $data");
        job = Job.fromMap(data);
        return job;
      } else {
        throw Exception("Failed to load job");
      }
    } finally {
      isLoading(false);
    }
  }

  createHeaders() {
    var accessToken = pref.getString("access_token");
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
  }
}
