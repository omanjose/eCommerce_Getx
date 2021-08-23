import 'package:e_commerce/shopX/productController.dart';
import 'package:e_commerce/shopX/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_chart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "New Market",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.view_list_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.grid_view),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return StaggeredGridView.countBuilder(
                      itemCount: productController.productList.length,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productController.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
