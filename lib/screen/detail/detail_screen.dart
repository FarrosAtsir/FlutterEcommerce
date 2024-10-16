import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/screen/detail/components/body.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detail';
  const DetailScreen({
    super.key, required this.product
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded)
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  "${product.rating}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 20, 
                )
              ],
            ),
          )
        ],
      ),
      body: Body(product: product,),
    );
  }
}
