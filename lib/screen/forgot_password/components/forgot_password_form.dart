import 'package:ecommerce/components/costum_suffix_icon.dart';
import 'package:ecommerce/components/error_form.dart';
import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});
  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getPropScreenWidth(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenWidth(20)),
          MyDefaultButton(
            text: "Reset Password", 
            press: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            }
          )
        ],
      )
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
