import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/screen/cart/components/body.dart';
import 'package:ecommerce/screen/cart/components/card_bottom_navigation.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CardBottomNavigation(),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded)
      ),
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Text(
                "${cart.cartItems.length} items",
                style: Theme.of(context).textTheme.bodySmall,
              );
            }
          )
        ],
      ),
    );
  }
}
