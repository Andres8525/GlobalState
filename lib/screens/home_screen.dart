import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';
import 'details_screen.dart';
import 'checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CartController controller = Get.put(CartController());

  final List<Product> products = [
    Product("Laptop", 1500, "High performance"),
    Product("Phone", 900, "Latest smartphone"),
    Product("Tablet", 600, "Portable device"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Store"),
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Get.to(() => CheckoutScreen());
                  },
                ),
                if (controller.cart.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        controller.cart.length.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          var product = products[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            onTap: () {
              Get.to(() => DetailsScreen(product: product));
            },
          );
        },
      ),
    );
  }
}
