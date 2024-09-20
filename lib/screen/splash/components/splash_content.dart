import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key, required this.text, required this.image,});

  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "ChiTaTo",
          style: TextStyle(
            fontSize: getPropScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            fontFamily: "cursive"
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kTextColor,
            fontSize: getPropScreenWidth(14),
          ),
        ),
        const Spacer(flex: 2,),
        Image.asset(
          height: getPropScreenHeight(265),
          width: getPropScreenWidth(235),
          image
        )
      ],
    );
  }
}