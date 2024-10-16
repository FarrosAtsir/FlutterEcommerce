import 'package:ecommerce/components/costum_navigation_bar.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screen/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CostumNavigatoinBar(menu: MenuState.profile),
    );
  }
}

AppBar myAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
    title: Text(
      "Your Profile",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    centerTitle: true,
  );
}
