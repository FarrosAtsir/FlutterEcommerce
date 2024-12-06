import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

ThemeData themeData(bool isDarkMode) {
    return ThemeData(
      fontFamily: "Muli",
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(),
        titleTextStyle: TextStyle(
          color: kTextColor,
          fontSize: 18
        )
      ),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme()
    );
  }

TextTheme textTheme() {
  return const TextTheme(
      titleMedium: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor)
    );
}

  InputDecorationTheme inputDecorationTheme() {
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      borderSide: BorderSide(color: kPrimaryColor),
      gapPadding: 10
    );
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      labelStyle: const TextStyle(color: kPrimaryColor),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder
    );
  }