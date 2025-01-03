import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({super.key, required this.icon,});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          getPropScreenWidth(20),
          getPropScreenWidth(20),
          getPropScreenWidth(20)
      ),
      child: SvgPicture.asset(
        icon,
        width: getPropScreenWidth(18),
      ),
    );
  }
}