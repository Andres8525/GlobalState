import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';
import 'details_screen.dart';
import 'checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CartController controller = Get.put(CartController());

  final Color navyBlue = const Color(0xFF0A1F44);
  final Color skyBlue = const Color(0xFF4FC3F7);

  final List<Product> products = [
    Product(
      "Laptop",
      1500,
      "High performance laptop",
      "assets/images/laptop.png",
    ),
    Product("Phone", 900, "Latest smartphone", "assets/images/phone.jpg"),
    Product("Tablet", 600, "Portable device", "assets/images/tablet.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skyBlue.withOpacity(0.08),
      appBar: AppBar(
        backgroundColor: navyBlue,
        title: const Text("Blue Store", style: TextStyle(color: Colors.white)),
        actions: [
          Obx(
            () => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Get.to(() => CheckoutScreen());
                  },
                ),
                if (controller.cart.isNotEmpty)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: skyBlue,
                      child: Text(
                        controller.cart.length.toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (_, index) {
          var product = products[index];

          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Image.asset(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: TextStyle(color: navyBlue, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "\$${product.price}",
                style: TextStyle(color: skyBlue, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.to(() => DetailsScreen(product: product));
              },
            ),
          );
        },
      ),
    );
  }
}
