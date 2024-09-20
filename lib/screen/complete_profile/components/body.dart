import 'package:ecommerce/components/costum_suffix_icon.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Complete Profile",
                style: headingStyle,
              ),
              const Text(
                "Complete your profile data",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              const CompleteProfileForm()
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String? firstName;
  String? lastName;
  String? phone;
  String? address;

  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onSaved: (newValue) => firstName = newValue,
          onChanged: (value) {},
          validator: (value) {},
          decoration: const InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(color: kPrimaryColor),
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(icon: "assets/icons/Lock.svg")
          ),
        )
      ],
    );
  }
}
