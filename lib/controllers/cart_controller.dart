import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  RxList<Product> cart = <Product>[].obs;

  void addProduct(Product product) {
    cart.add(product);
  }

  void removeProduct(Product product) {
    cart.remove(product);
  }

  double get total {
    double sum = 0;
    for (var item in cart) {
      sum += item.price;
    }
    return sum;
  }
}
