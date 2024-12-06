import 'package:ecommerce/screen/favourite/components/body.dart';
import 'package:ecommerce/state_managements/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/fav";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const Body(),
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
            "Your Favourites",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Consumer<FavouriteProvider>(
            builder: (context, fav, child) {
              return Text(
                "${fav.favouritesProducts.length} items",
                style: Theme.of(context).textTheme.bodySmall,
              );
            }
          )
        ],
      ),
    );
  }
}
