import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key, required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getPropScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getPropScreenWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor.withOpacity(0.1)
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: getPropScreenWidth(20)),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(height: getPropScreenWidth(10)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\$${cart.product.price}",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(18),
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor
                    ),
                  ),
                  TextSpan(
                    text: " x${cart.numOfItem}",
                    style: const TextStyle(color: kTextColor)
                  )
                ]
              )
            ),
          ],
        )
      ],
    );
  }
}