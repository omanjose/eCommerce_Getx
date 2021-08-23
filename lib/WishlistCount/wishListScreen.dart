import 'package:e_commerce/WishlistCount/wishProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  // Ask Get to find our controller
  //final Product _products = Get.find<Product>();

  final _products = Get.put(ProductWish());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: _products.wishListItems.length,
            itemBuilder: (context, index) {
              final item = _products.wishListItems[index];
              return Card(
                key: ValueKey(item.id),
                margin: EdgeInsets.all(5),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                      onPressed: () {
                        item.inWishList.value = false;
                        _products.removeItem(item.id);
                      },
                      icon: Icon(Icons.close)),
                ),
              );
            });
      }),
    );
  }
}
