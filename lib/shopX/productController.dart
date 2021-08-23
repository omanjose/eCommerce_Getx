import 'package:e_commerce/shopX/apiService.dart';
import 'package:e_commerce/shopX/product.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
     isLoading(false);
    }
    
  }
}
