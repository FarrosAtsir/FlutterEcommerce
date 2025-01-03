import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/screen/cart/cart_screen.dart';
import 'package:ecommerce/screen/home/components/banner_discount.dart';
import 'package:ecommerce/screen/home/components/icon_with_trigger.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Consumer<CartProvider>(
              builder: (context, cart, child) {
                return IconWithTrigger(
                  svgIcon: "assets/icons/Cart Icon.svg",
                  trigger: cart.cartItems.length.toString()
                );
              }
            ),
          ),
          const IconWithTrigger(
            svgIcon: "assets/icons/Bell.svg"
          )
        ],
      ),
    );
  }
}
