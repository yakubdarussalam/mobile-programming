import 'dart:convert';
import 'package:flutter_uas/models/saved_job_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SavedJobController extends GetxController {
  var isLoading = false.obs;
  final String url = "http://10.0.2.2:3000";
  var savedJobs = <SavedJob>[].obs;
  late SavedJob savedJob;

  late SharedPreferences pref;

  @override
  void onInit() {
    super.onInit();
    initPrefs();
  }

  void initPrefs() async {
    pref = await SharedPreferences.getInstance();
    await getSavedJobs();
  }

  refreshSavedJob() async {
    savedJobs.clear();
    await getSavedJobs();
  }

  getSavedJobs() async {
    try {
      isLoading(true);
      final headers = createHeaders();
      final response =
          await http.get(Uri.parse("$url/saved_jobs"), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        savedJobs.value = List<SavedJob>.from(
            data['data'].map((item) => SavedJob.fromMap(item)));
      }
    } finally {
      isLoading(false);
    }
  }

  getSavedJob(int id) async {
    try {
      isLoading(true);
      final headers = createHeaders();
      final response =
          await http.get(Uri.parse("$url/saved_jobs/$id"), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        savedJob = SavedJob.fromMap(data);
      }
    } finally {
      isLoading(false);
    }
  }

  insertSavedJob() async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final response = await http.post(Uri.parse("$url/saved_jobs"),
        headers: headers, body: jsonEncode(savedJob.toMap()));
    if (response.statusCode == 200) {
      refreshSavedJob();
      return true;
    }
    print("Failed to insert product: ${response.statusCode} ${response.body}");
    return false;
  }

  deleteSavedJob(int id) async {
    final response = await http.delete(Uri.parse("$url/saved_jobs/$id"));
    if (response.statusCode == 200) {
      refreshSavedJob();
      return true;
    }
    print(
        "Failed to delete saved job: ${response.statusCode} ${response.body}");
    return false;
  }

  Map<String, String> createHeaders() {
    var accessToken = pref.getString("access_token");
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
  }
}
