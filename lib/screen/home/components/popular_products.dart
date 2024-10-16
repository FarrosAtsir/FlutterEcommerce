import 'package:ecommerce/components/item_popular_product.dart';
import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/screen/detail/detail_screen.dart';
import 'package:ecommerce/screen/home/components/section_title.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(title: "Popular Products"),
        ),
        SizedBox(height: getPropScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getPropScreenWidth(220),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
              child: Row(
                children: List.generate(
                  demoProducts.length, 
                  (index){
                    final Product product = demoProducts[index];
                    return ItemPopularProduct(
                      product: product,
                      press: () => Navigator.pushNamed(
                        context, 
                        DetailScreen.routeName, 
                        arguments: product
                      ),
                    );
                  }
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}
