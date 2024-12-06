import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _email;

  bool get isLoggedIn => _isLoggedIn;
  String? get email => _email;

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status, {String? email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    if (status) {
      _email = email;
    } else {
      _email = null;
    }
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }
}
