import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
              )
            ],
          ),
          SizedBox(height: getPropScreenWidth(20)),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Row(
                children: [
                  Text.rich(
                    TextSpan(
                     children: [
                      const TextSpan(text: "Total:\n"),
                      TextSpan(
                        text: "\$${cart.totalPrice}",
                        style: const TextStyle(
                          fontSize: 16,
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
                      press: (){
                        cart.clearCart();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Checkout success"))
                        );
                      }
                    ),
                  )
                ],
              );
            }
          )
        ],
      ),
    );
  }
}
