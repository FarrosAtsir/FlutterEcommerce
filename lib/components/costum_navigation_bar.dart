import 'package:ecommerce/constant.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screen/home/home_screen.dart';
import 'package:ecommerce/screen/profile/profile_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CostumNavigatoinBar extends StatelessWidget {
  const CostumNavigatoinBar({
    super.key, required this.menu,
  });

  final MenuState menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getPropScreenWidth(15)
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFdadada).withOpacity(0.3),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MenuState.home == menu 
              ? kPrimaryColor.withOpacity(0.5)
              : Colors.transparent,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, HomeScreen.routeName);
              }, 
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == menu 
                ? Colors.white
                : inActiveIconColor,
              )
            ),
          ),
          IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset("assets/icons/Heart Icon.svg")
          ),
          IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg")
          ),
          Container(
            decoration: BoxDecoration(
              color: MenuState.profile == menu 
              ? kPrimaryColor.withOpacity(0.5)
              : Colors.transparent,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }, 
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == menu 
                ? Colors.white 
                : inActiveIconColor,
              )
            ),
          ),
        ],
      ),
    );
  }
}
