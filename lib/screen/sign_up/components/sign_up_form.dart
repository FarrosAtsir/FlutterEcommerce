import 'package:ecommerce/components/costum_suffix_icon.dart';
import 'package:ecommerce/components/error_form.dart';
import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email;
  String? password;
  String? confirmPassword;

  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          passwordFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          passwordConfirmationFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20)),
          MyDefaultButton(
            text: "Continue", 
            press: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (errors.isEmpty) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            }
          ),
        ],
      ),
    );
  }

  TextFormField passwordConfirmationFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        setState(() {
          confirmPassword = value;
        });
        if (password == value) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty || errors.contains(kMatchPassError)) {
          return "";
        }else if(value != password){
          setState(() {
            errors.add(kMatchPassError);
          });
        }
        return "";
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password Confirmation",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: "assets/icons/Lock.svg")
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          password = value;
        });
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }else if(value.length >= 8 && 
        errors.contains(kShortPassError)){
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }else if(value.length < 8 && 
        (!errors.contains(kPassNullError) && 
        !errors.contains(kShortPassError))){
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: "assets/icons/Lock.svg")
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }else if(emailValidatorRegExp.hasMatch(value) && 
        errors.contains(kInvalidEmailError)){
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty&&!errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        }else if(!emailValidatorRegExp.hasMatch(value) && 
        (!errors.contains(kPassNullError)) && 
        !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: "assets/icons/Mail.svg")
      ),
    );
  }
}