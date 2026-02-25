import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.cart.length,
                itemBuilder: (_, index) {
                  var item = controller.cart[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("\$${item.price}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.removeProduct(item);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Total: \$${controller.total}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Pay Now")),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
