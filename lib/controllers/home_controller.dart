import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final String apiUrl = 'https://api.thecatapi.com/v1/breeds';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        products.value = data.map((json) => Product.fromJson(json)).toList();
      } else {
        errorMessage("Failed to load products");
      }
    } catch (e) {
      errorMessage("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
