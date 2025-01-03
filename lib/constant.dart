import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff9BA8F9);
const kPrimaryLightColor = Color(0xffffecdf);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xffffa53e),
  Color(0xffff7643)
]);

const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xff575757);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getPropScreenWidth(24),
  fontWeight: FontWeight.bold,
  height: 1.5,
);

final RegExp emailValidatorRegExp = 
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

// complete profile
const String kNameNullError = "Please enter your name";
const String kNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

// otp style
final otpDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getPropScreenWidth(15)),
  enabledBorder: otpOutlineInputBorder(),
  focusedBorder: otpOutlineInputBorder(),
  border: otpOutlineInputBorder()
);

OutlineInputBorder otpOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor)
  );
}

const defaultDuration = Duration(milliseconds: 250);

TextStyle seeMoreStyle = TextStyle(
  fontSize: getPropScreenWidth(16),
  fontWeight: FontWeight.bold,
  color: kPrimaryColor
);

const inActiveIconColor = Color(0xffb6b6b6);