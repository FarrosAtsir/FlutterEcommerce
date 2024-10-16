import 'package:ecommerce/components/costum_navigation_bar.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screen/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CostumNavigatoinBar(menu: MenuState.home),
    );
  }
}
