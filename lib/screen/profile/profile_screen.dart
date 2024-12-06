import 'package:ecommerce/components/costum_navigation_bar.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screen/profile/components/body.dart';
import 'package:ecommerce/state_managements/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    leading: Text(""),
    title: Text(
      "Your Profile",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    centerTitle: true,
    actions: [
      Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return IconButton(
            onPressed: (){
              theme.toogleTheme(!theme.isDarkMode);
            }, 
            icon: Icon(
              theme.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
              color: Theme.of(context).iconTheme.color,
            )
          );
        }
      )
    ],
  );
}
