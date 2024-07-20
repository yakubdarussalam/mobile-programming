import 'dart:convert';
import 'package:flutter_uas/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  final String url = "http://10.0.2.2:3000";
  List<User> users = <User>[].obs;
  late User user;

  late SharedPreferences pref;

  @override
  void onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('user_id') ?? 0;
    await getUser(userId);
  }

  refreshUser(int userId) async {
    users.clear();
    await getUser(userId);
  }

  getUsers() async {
    try {
      isLoading(true);
      final headers = createHeaders();
      final response =
          await http.get(Uri.parse("$url/users"), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        users = List<User>.from(data['data'].map((item) => User.fromMap(item)));
      }
    } finally {
      isLoading(false);
    }
  }

  getUser(int id) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("$url/users/$id"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        user = User.fromMap(data);
      }
    } finally {
      isLoading(false);
    }
  }

  updateUser(User updatedUser) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final response = await http.put(
      Uri.parse('$url/users/${updatedUser.id}'),
      headers: headers,
      body: jsonEncode(updatedUser.toMap()),
    );
    if (response.statusCode == 200) {
      print("Account updated successfully");
      return true;
    }
    print("Failed to update account: ${response.statusCode} ${response.body}");
    return false;
  }

  createHeaders() {
    var accessToken = pref.getString("access_token");
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
  }
}
