import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key, required this.icon, required this.press,
  });

  final String icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press;
      },
      child: Container(
        padding: EdgeInsets.all(getPropScreenWidth(12)),
        height: getPropScreenHeight(45),
        width: getPropScreenWidth(45),
        margin: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
        decoration: const BoxDecoration(
          color: Color(0xfff5f6f9), 
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}