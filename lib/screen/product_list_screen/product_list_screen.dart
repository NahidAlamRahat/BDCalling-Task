import 'package:bd_calling_task/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  static String name = 'product-list/screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (_, index) {
            final product = controller.productList[index];
            return ListTile(
              title: Text(product.title),
              leading: Image.network(
                product.image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AssetsImagePath.noImage,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
