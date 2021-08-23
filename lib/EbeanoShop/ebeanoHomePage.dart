import 'package:e_commerce/EbeanoShop/cartController.dart';
import 'package:e_commerce/EbeanoShop/ebeanocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbeanoHomePage extends StatelessWidget {
  // const EbeanoHomePage({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  final ebeanoController = Get.put(EbeanoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Ebeano Shop',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_bag),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GetX<EbeanoController>(
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.products[index].productName}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${controller.products[index].productDescription}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$ ${controller.products[index].price}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]),
                                  ElevatedButton(
                                    onPressed: () {
                                      //adding elements to the cart
                                      cartController.addToCart(
                                          controller.products[index]);
                                    },
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(),
                                    ),
                                  ),
                                  Obx(() => IconButton(
                                        icon: controller.products[index]
                                                .isFavorite.value
                                            ? Icon(Icons.check_box_rounded)
                                            : Icon(
                                                Icons.check_box_outline_blank),
                                        onPressed: () {
                                          ebeanoController
                                              .products[index].isFavorite
                                              .toggle();
                                        },
                                      )),
                                  // GetBuilder<CartController>(
                                  //   builder: (controller){
                                  //   return Text('Total amount: \$ ${controller.testAmount}',
                                  //   style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)

                                  //                    );
                                  //                    }
                                  // ),
                                  // GetX<CartController>(
                                  //   builder: (controller){
                                  //   return Text('Total amount: \$ ${controller.totalPrice}',
                                  //   style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)

                                  //                    );
                                  //                    }
                                  // ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            Obx(
              () {
                return Text('Total amount: \$ ${cartController.totalPrice}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
              },
            ),
          ],
        ),
      ),
    );
  }
}
