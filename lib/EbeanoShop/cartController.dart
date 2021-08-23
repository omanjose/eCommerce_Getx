import 'package:e_commerce/EbeanoShop/ebeano.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;

  //totalprice works with obs and getx
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }
  //get builder uses this
  //double testAmount = 0.0;

  addToCart(Product product) {
    cartItems.add(product);
    //getbuilder logic else obx is already doing it automatically
    // testAmount = totalPrice;
    // update();
  }
}
