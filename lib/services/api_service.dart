import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/product.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response =
    await client.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return (json.decode(jsonString) as List)
          .map((i) => Product.fromJson(i))
          .toList();
    } else {
      // Xử lý lỗi
      return null;
    }
  }
}