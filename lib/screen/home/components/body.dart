import 'package:ecommerce/screen/detail/detail_screen.dart';
import 'package:ecommerce/screen/home/components/banner_discount.dart';
import 'package:ecommerce/screen/home/components/categories_home.dart';
import 'package:ecommerce/screen/home/components/header_home_part.dart';
import 'package:ecommerce/screen/home/components/popular_products.dart';
import 'package:ecommerce/screen/home/components/special_offer.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/state_managements/product_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Stack(
        children:[ SingleChildScrollView(
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
              SizedBox(height: getPropScreenHeight(20)),
            ],
          ),
        ),
        if (searchProvider.searchResult.isNotEmpty)
          Positioned(
            top: getPropScreenHeight(80), // Menempatkan tepat di bawah SearchField
            left: 20,
            right: 20,
            child: _buildSearchSuggestion(searchProvider),
          ),
        ]
      ),
    );
  }

  Widget _buildSearchSuggestion(ProductProvider searchProvider){
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: searchProvider.searchResult.length,
          itemBuilder: (context, index) {
            final product = searchProvider.searchResult[index];
            return ListTile(
              title: Text(product.title),
              onTap: () {
                Navigator.pushNamed(context, DetailScreen.routeName, arguments: product);
              },
            );
          },
        ),
      ),
    );
  }
}
