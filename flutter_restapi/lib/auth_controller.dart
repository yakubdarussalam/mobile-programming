import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final url = "http://10.0.2.2:3000";
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var message = "".obs;

  login(Map<String, dynamic> payload) async {
    isLoading(true);
    message("");
    final http = GetConnect();
    final response = await http.post("$url/login", payload);
    final data = response.body;
    if (response.statusCode == 200) {
      final pref = await SharedPreferences.getInstance();
      var accessToken = data["access_token"];
      pref.setString("access_token", accessToken);
      print("Access Token = $accessToken");
      isLoggedIn(true);
    } else if (response.statusCode == 422) {
      final errors = data["errors"];
      final error = errors[0];
      message(error['msg']);
      isLoggedIn(false);
    } else {
      message(data["message"]);
      isLoggedIn(false);
    }
    isLoading(false);
  }
}
