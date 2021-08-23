import 'package:e_commerce/EbeanoShop/ebeano.dart';
import 'package:get/get.dart';

class EbeanoController extends GetxController {
  //elements to bind to the UI,
  //MVC concept
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetch();
  }

  void fetch() async {
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          price: 30,
          productName: 'Sony Mobile',
          productImage: 'sony!',
          productDescription: 'Better machine'),
      Product(
          id: 2,
          price: 400,
          productName: 'iPhone5 plus',
          productImage: 'i Phone',
          productDescription: 'London used'),
      Product(
          id: 3,
          price: 290,
          productName: 'iPhone4 plus',
          productImage: 'i Phone',
          productDescription: 'Recent purchased'),
      Product(
          id: 2,
          price: 40,
          productName: 'BYC singlet',
          productImage: 'BYC brand',
          productDescription: 'Stock clothings'),
    ];
    products.value = serverResponse;
  }
}
