import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key, required this.name, required this.icon,
  });

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(55),
            height: getPropScreenWidth(55),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              icon,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: getPropScreenHeight(5)),
          Text(
            name,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
