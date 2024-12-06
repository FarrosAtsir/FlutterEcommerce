import 'package:ecommerce/screen/profile/components/item_button_profile.dart';
import 'package:ecommerce/screen/profile/components/profile_picture.dart';
import 'package:ecommerce/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state_managements/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: getPropScreenWidth(30)),
      child: Column(
        children: [
          const ProfilePicture(),
          SizedBox(height: getPropScreenWidth(20)),
          Consumer<AuthProvider>(
            builder: (context, auth, child){
              return Text(
                auth.email ?? "",
                style: TextStyle(
                  fontSize: getPropScreenWidth(16),
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          ),
          SizedBox(height: getPropScreenWidth(20)),
          Column(
            children: [
              ItemButtonProfile(
                svgIcon: "assets/icons/User Icon.svg", 
                title: "My Account", 
                press: (){}
              ),
              ItemButtonProfile(
                svgIcon: "assets/icons/Bell.svg", 
                title: "Notifications", 
                press: (){}
              ),
              ItemButtonProfile(
                svgIcon: "assets/icons/Settings.svg", 
                title: "Settings", 
                press: (){}
              ),
              ItemButtonProfile(
                svgIcon: "assets/icons/Question mark.svg", 
                title: "Help Center", 
                press: (){}
              ),
              ItemButtonProfile(
                svgIcon: "assets/icons/Log out.svg", 
                title: "Log Out", 
                press: (){
                  Provider.of<AuthProvider>(context, listen: false).setAuth(false);
                  Navigator.pushNamedAndRemoveUntil(
                    context, 
                    SignInScreen.routeName,
                    (Route<dynamic> route) => false
                  );
                }
              ),
            ],
          )
        ],
      )
    );
  }
}
