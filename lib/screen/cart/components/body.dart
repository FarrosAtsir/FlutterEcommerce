import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/screen/cart/components/item_cart.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartData, child) {
        return ListView.builder(
          itemCount: cartData.cartItems.length,
          itemBuilder: (context, index){
            final Cart cart = cartData.cartItems[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10),
              ),
              child: Dismissible(
                key: Key(cart.product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction){
                  cartData.removeCartItem(cart);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: getPropScreenWidth(20)),
                        child: const Icon(
                          Icons.delete_outline, 
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                child: ItemCart(cart: cart)
              ),
            );
          }
        );
      }
    );
  }
}
