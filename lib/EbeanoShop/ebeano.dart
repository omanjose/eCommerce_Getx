import 'package:get/get.dart';

class Product {
  late final int id;
  late final String productName;
  late final String productImage;
  late final String productDescription;
  late final double price;

  Product({
    required this.id,
    required this.price,
    required this.productName,
    required this.productImage,
    required this.productDescription,
  });

  final isFavorite = false.obs;
  final quantity = 1.obs;
}
