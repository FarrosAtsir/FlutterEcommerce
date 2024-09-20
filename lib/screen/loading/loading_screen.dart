import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatefulWidget {
  static String routeName = "/loading_screen";
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, 
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPrimaryColor,
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ChiTaTo",
              style: TextStyle(
                fontSize: 70,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: "cursive"
              ),
            ),
          ],
        ),
      ),
    );
  }
}