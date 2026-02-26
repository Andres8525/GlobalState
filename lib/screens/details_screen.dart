import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  DetailsScreen({super.key, required this.product});

  final CartController controller = Get.find();

  final Color navyBlue = const Color(0xFF0A1F44);
  final Color skyBlue = const Color(0xFF4FC3F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skyBlue.withOpacity(0.05),
      appBar: AppBar(
        backgroundColor: navyBlue,
        title: const Text("Details", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(product.image, height: 200),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: navyBlue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 22, color: skyBlue),
            ),
            const SizedBox(height: 15),
            Text(product.description),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navyBlue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                controller.addProduct(product);
                Get.snackbar(
                  "Success",
                  "Added to cart",
                  backgroundColor: skyBlue,
                  colorText: Colors.white,
                );
              },
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
