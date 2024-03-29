import 'package:get/get.dart';

class Item {
  late int id;
  late String name;
  late double price;
  late RxBool inWishList;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.inWishList});
}
