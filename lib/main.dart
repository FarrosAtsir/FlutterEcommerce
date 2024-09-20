import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screen/loading/loading_screen.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialRoute: LoadingScreen.routeName,
      routes: routes,
    );
  }
}
