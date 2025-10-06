import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        var products = jsonData.map((e) => Product.fromJson(e)).toList();
        productList.value = products;

        final box = Hive.box('products');
        await box.clear(); // clear old cache
        for (var product in products) {
          box.add(product);
        }
      }
    } catch (e) {
      // Load offline data
      final box = Hive.box('products');
      productList.value = box.values.cast<Product>().toList();
    } finally {
      isLoading(false);
    }
  }
}
