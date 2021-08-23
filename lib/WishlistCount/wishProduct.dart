import 'dart:math';

import 'package:e_commerce/WishlistCount/wishModel.dart';
import 'package:get/get.dart';

class ProductWish extends GetxController {
  // All products
  // In production, these things usually be loaded them from API or database or something like that
  RxList<Item> _items = List.generate(
      100,
      (index) => Item(
          id: index,
          name: 'Product Listing $index',
          price: Random().nextDouble() * 100,
          inWishList: false.obs)).obs;

  //Use this to retrieve all products
  List<Item> get items {
    return [..._items];
  }

  //returning products that were added to the wish list
  List<Item> get wishListItems {
    return _items.where((x) => x.inWishList.value == true).toList();
  }

  //Add an item to the wish list
  void additem(int id) {
    final int index = _items.indexWhere((x) => x.id == id);
    _items[index].inWishList.value = true;
  }

  //Remove an item from wishList
  void removeItem(int id) {
    final int index = _items.indexWhere((x) => x.id == id);
    _items[index].inWishList.value = false;
  }
}
