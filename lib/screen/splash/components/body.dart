import 'dart:async';
import 'dart:ui';

import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/splash_data.dart';
import 'package:ecommerce/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screen/splash/components/splash_content.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override

  int currentPage = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                  print(currentPage);
                },
                itemCount: splashData.length,
                itemBuilder: (context, index)=>SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!
                )
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (
                          index)=>dotBuilder(index: index)
                      ),
                    ),
                    const Spacer(flex: 3),
                     MyDefaultButton(
                      press: currentPage == 2 ? (){
                        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                      } : null,
                      text: currentPage == 2 ? "Get Started" : "Swipe right",
                    ),
                    const Spacer()
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer dotBuilder({required int index}) {
    return AnimatedContainer(
        duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage==index?20:6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor :const Color(0xffd8d8d8),
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }
}
