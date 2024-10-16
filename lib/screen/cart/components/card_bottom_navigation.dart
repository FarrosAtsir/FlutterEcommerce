import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardBottomNavigation extends StatelessWidget {
  const CardBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(30),
        vertical: getPropScreenWidth(15)
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFdadada).withOpacity(0.3),
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(getPropScreenWidth(10)),
                width: getPropScreenWidth(40),
                height: getPropScreenWidth(40),
                decoration: BoxDecoration(
                  color: const Color(0xfff5f6f9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: kPrimaryColor,
                ),
              ),
              const Spacer(),
              const Text("Add Voucher Code"),
              const SizedBox(width: 7),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: Colors.black,
              )
            ],
          ),
          SizedBox(height: getPropScreenWidth(20)),
          Row(
            children: [
              const Text.rich(
                TextSpan(
                 children: [
                  TextSpan(text: "Total:\n"),
                  TextSpan(
                    text: "\$337.15",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                    )
                  )
                 ]
                )
              ),
              const Spacer(),
              SizedBox(
                width: getPropScreenWidth(190),
                child: MyDefaultButton(
                  text: "Check Out", 
                  press: (){}
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
