import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
              fontSize: getPropScreenWidth(20),
              color: Colors.black
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite 
              ? kPrimaryColor.withOpacity(0.5)
              : kSecondaryColor.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20)
              ),
            ),
            child: Icon(
              Icons.favorite,
              size: getPropScreenWidth(20),
              color: product.isFavourite 
              ? Colors.red 
              : kSecondaryColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(64)
          ),
          child: ReadMoreText(
            product.description,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: kPrimaryColor,
            lessStyle: seeMoreStyle,
            trimCollapsedText: "\nShow More",
            trimExpandedText: "\nShow Less",
            moreStyle: seeMoreStyle
          ),
        )
      ],
    );
  }
}