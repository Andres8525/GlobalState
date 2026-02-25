import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  DetailsScreen({super.key, required this.product});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(product.name, style: const TextStyle(fontSize: 24)),
            Text("\$${product.price}"),
            const SizedBox(height: 20),
            Text(product.description),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                controller.addProduct(product);
                Get.snackbar("Success", "Product added to cart");
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
