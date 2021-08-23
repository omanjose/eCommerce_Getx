import 'package:e_commerce/WishlistCount/wishListScreen.dart';
import 'package:e_commerce/WishlistCount/wishProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishHomeScreen extends StatelessWidget {
  final products = Get.put(ProductWish());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish list Demo'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              InkWell(
                child: Container(
                  width: 300,
                  height: 80,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Obx(() {
                    return Text(
                      'Cart count: ${products.wishListItems.length}',
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    );
                  }),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishListScreen())),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: products.items.length,
                    itemBuilder: (context, index) {
                      final i = products.items[index];
                      return Card(
                        key: ValueKey(i.id),
                        margin: EdgeInsets.all(5),
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(i.name),
                          subtitle: Text("\$ ${i.price.toStringAsFixed(2)}"),
                          trailing: Obx(() {
                            return IconButton(
                              onPressed: () {
                                if (i.inWishList.value == false) {
                                  products.additem(i.id);
                                } else {
                                  products.removeItem(i.id);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: i.inWishList.value == false
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            );
                          }),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
