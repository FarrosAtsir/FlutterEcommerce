import 'package:ecommerce/screen/login_success/components/body.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
