import 'package:e_commerce/shopX/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(product.title,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              overflow: TextOverflow.ellipsis),
          SizedBox(height: 5),
          //if(product.rating != null)
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text(product.rating.toString(),
          //       style: TextStyle(color: Colors.white),),
          //       Icon(Icons.star,
          //       size: 16,
          //       color: Colors.white,)
          //     ],
          //   ),
          // )

          //SizedBox(height: 2),
          Text(
            "\$ ${product.id}",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
