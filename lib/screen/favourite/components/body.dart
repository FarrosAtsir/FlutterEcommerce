import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/products.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:ecommerce/state_managements/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, fav, child) {
        return ListView.builder(
          itemCount: fav.favouritesProducts.length,
          itemBuilder: (context, index){
            final Product product = fav.favouritesProducts[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10),
              ),
              child: Slidable(
                key: Key(product.id.toString()),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), 
                  children: [
                    SlidableAction(
                      onPressed: (context){
                        Provider.of<CartProvider>(context, listen: false)
                        .addCartItem(Cart(product: product, numOfItem: 1));
                        fav.toogleFavouriteStatus(product.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Added to cart"), 
                            duration: Duration(seconds: 2)
                          )
                        );
                      },
                      icon: Icons.shopping_cart,
                      label: "Cart",
                      padding: EdgeInsets.all(getPropScreenWidth(20)),
                      backgroundColor: kPrimaryColor,
                    ),
                    SlidableAction(
                      onPressed: (context){
                        fav.toogleFavouriteStatus(product.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removed from favourite"), 
                            duration: Duration(seconds: 2)
                          )
                        );
                      },
                      icon: Icons.delete,
                      label: "Delete",
                      padding: EdgeInsets.all(getPropScreenWidth(20)),
                      backgroundColor: Colors.red,
                    )
                  ]
                ),
                // item cart
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getPropScreenWidth(88),
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(getPropScreenWidth(15)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondaryColor.withOpacity(0.1)
                          ),
                          child: Image.asset(product.images[0])
                        ),
                      ),
                    ),
                    SizedBox(width: getPropScreenWidth(20)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                        ),
                        SizedBox(height: getPropScreenWidth(10)),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${product.price}",
                                style: TextStyle(
                                  fontSize: getPropScreenWidth(18),
                                  fontWeight: FontWeight.w900,
                                  color: kPrimaryColor
                                ),
                              ),
                            ]
                          )
                        ),
                      ],
                    )
                  ],
                )
              ),
            );
          }
        );
      }
    );
  }
}
