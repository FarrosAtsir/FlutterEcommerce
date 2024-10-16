import 'package:ecommerce/screen/home/components/banner_discount.dart';
import 'package:ecommerce/screen/home/components/categories_home.dart';
import 'package:ecommerce/screen/home/components/header_home_part.dart';
import 'package:ecommerce/screen/home/components/popular_products.dart';
import 'package:ecommerce/screen/home/components/special_offer.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getPropScreenHeight(20)),
            const HeaderHomePart(),
            SizedBox(height: getPropScreenHeight(10)),
            const BannerDiscount(),
            SizedBox(height: getPropScreenHeight(10)),
            const Categories(),
            SizedBox(height: getPropScreenHeight(10)),
            const SpecialOffer(),
            SizedBox(height: getPropScreenHeight(20)),
            const PopularProducts(),
            SizedBox(height: getPropScreenHeight(20))
          ],
        ),
      ),
    );
  }
}
