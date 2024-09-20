import 'package:ecommerce/components/social_media_icon.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/sign_up/components/sign_up_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.03),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center
              ),
              SizedBox(height: SizeConfig.screenHeight*0.06),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight*0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaIcon(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {}
                  ),
                  SocialMediaIcon(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {}
                  ),
                  SocialMediaIcon(
                    icon: 'assets/icons/twitter.svg',
                    press: () {}
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight*0.03),
              const Text(
                "By continuing your confirm that you agree \nwith our Term and Condition",
                textAlign: TextAlign.center
              )
            ],
          ),
        ),
      ),
    );
  }
}
