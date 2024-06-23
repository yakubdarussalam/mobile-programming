import 'dart:convert';
import 'package:flutter_restapi/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;
  final String url = "http://10.0.2.2:3000";
  List<Product> products = <Product>[].obs;
  late Product product;

  @override
  void onInit() async {
    super.onInit();
    await getProducts(1);
  }

  refreshProduct() async {
    products.clear();
    await getProducts(1);
  }

  createProduct() {
    product = Product(
        id: 0,
        title: '',
        description: '',
        category: '',
        price: 0,
        discountPercentage: 0,
        rating: 0,
        brand: '',
        stock: 0,
        thumbnail: '',
        images: '');
  }

  getProducts(int page) async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse("$url/products?page=$page&perpage=100"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        products = List<Product>.from(
            data['data'].map((item) => Product.fromMap(item)));
      }
    } finally {
      isLoading(false);
    }
  }

  getProduct(int id) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("$url/products/$id"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        product = Product.fromMap(data);
      }
    } finally {
      isLoading(false);
    }
  }

  insertProduct() async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final response = await http.post(Uri.parse("$url/products"),
        headers: headers, body: jsonEncode(product.toMap()));
    if (response.statusCode == 200) {
      return true;
    }
    print("Failed to insert product: ${response.statusCode} ${response.body}");
    return false;
  }

  updateProduct(int id) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final response = await http.put(Uri.parse('$url/products/$id'),
        headers: headers, body: jsonEncode(product.toMap()));
    if (response.statusCode == 200) {
      print("Product updated successfully");
      return true;
    }
    print("Failed to update product: ${response.statusCode} ${response.body}");
    return false;
  }

  deleteProduct(int id) async {
    final response = await http.delete(Uri.parse("$url/products/$id"));
    if (response.statusCode == 200) {
      return true;
    }
    print("Failed to delete product: ${response.statusCode} ${response.body}");
    return false;
  }
}
