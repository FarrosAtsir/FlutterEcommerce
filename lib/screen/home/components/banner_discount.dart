import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/state_managements/product_provider.dart';

class BannerDiscount extends StatelessWidget {
  const BannerDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/summer.jpg"),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(text: "A Summer Suprise\n"),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: getPropScreenWidth(24),
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<ProductProvider>(context, listen: false);
    return Container(
      width: SizeConfig.screenWidth*0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        onChanged: (value) => searchProvider.searchProducts(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenHeight(9)
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Pruduct",
          prefixIcon: const Icon(Icons.search)
        ),
      ),
    );
  }
}