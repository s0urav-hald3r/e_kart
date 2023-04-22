import 'package:e_kart/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  addToCart(ProductModel productModel) {
    cartItems.add(productModel);
  }

  int get totalCartItems => cartItems.length;

  double get totalCartValue =>
      cartItems.fold(0, (total, item) => total + item.pAmout!);
}
