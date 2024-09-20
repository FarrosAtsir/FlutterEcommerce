import 'package:ecommerce/components/costum_suffix_icon.dart';
import 'package:ecommerce/components/error_form.dart';
import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screen/login_success/login_success_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final List<String> errors = [];
  bool remember = false;
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
          rememberAndForget(context),
          SizedBox(height: getPropScreenHeight(20)),
          ErrorForm(errors: errors,),
          SizedBox(height: getPropScreenHeight(20)),
          MyDefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (errors.isEmpty) {
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            }
          )
        ],
      )
    );
  }

  Row rememberAndForget(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: remember,
          onChanged: (value) {
            setState(() {
              remember = value!;
            });
          },
          activeColor: kPrimaryColor,
        ),
        const Text("Remember Me"),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
          },
          child: const Text(
            "Forgot Password",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onChanged: (value) {
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
