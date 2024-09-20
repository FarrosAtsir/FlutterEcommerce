import 'package:ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screen/loading/loading_screen.dart';
import 'package:ecommerce/screen/login_success/login_success_screen.dart';
import 'package:ecommerce/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screen/sign_up/sign_up_screen.dart';
import 'package:ecommerce/screen/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context)=>const SplashScreen(),
  SignInScreen.routeName: (context)=>const SignInScreen(),
  ForgotPasswordScreen.routeName: (context)=>const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context)=>const LoginSuccessScreen(),
  SignUpScreen.routeName: (context)=>const SignUpScreen(),
  CompleteProfileScreen.routeName: (context)=>const CompleteProfileScreen(),
  LoadingScreen.routeName: (context)=>const LoadingScreen()
};