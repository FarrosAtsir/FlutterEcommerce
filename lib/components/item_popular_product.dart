import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class ItemPopularProduct extends StatelessWidget {
  const ItemPopularProduct({
    super.key, required this.product, required this.press,
  });

  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
      child: SizedBox(
        width: getPropScreenWidth(140),
        child: GestureDetector(
          onTap: press,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getPropScreenWidth(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSecondaryColor.withOpacity(0.1)
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              SizedBox(height: getPropScreenWidth(15)),
              Text(
                product.title,
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(18),
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor
                    ),
                  ),
                  Container(
                    height: getPropScreenWidth(28),
                    width: getPropScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isFavourite == true 
                      ? kPrimaryColor.withOpacity(0.2) 
                      : kSecondaryColor.withOpacity(0.2),
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: product.isFavourite == true 
                      ? Colors.red 
                      : kSecondaryColor,
                      size: getPropScreenWidth(15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
