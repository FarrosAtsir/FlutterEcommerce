import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/screen/detail/components/color_picker.dart';
import 'package:ecommerce/screen/detail/components/detail_description.dart';
import 'package:ecommerce/screen/detail/components/image_detail.dart';
import 'package:ecommerce/screen/detail/components/rounded_container.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: product),
                  SizedBox(height: getPropScreenWidth(40)),
                  ColorPicker(product: product),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropScreenWidth(70),
                      vertical: getPropScreenWidth(40)
                    ),
                    child: MyDefaultButton(
                      text: "Add To Cart", 
                      press: (){}
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
