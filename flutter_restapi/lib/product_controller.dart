import 'dart:convert';

import 'package:flutter_restapi/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;
  final String url = "https://dummyjson.com";
  List<Product> products = <Product>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getProduct();
  }

  getProduct() async {
    isLoading(true);
    final response = await http.get(Uri.parse("$url/products"));
    isLoading(false);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      products = List<Product>.from(
          data['products'].map((item) => Product.fromMap(item)));
    }
  }
}
