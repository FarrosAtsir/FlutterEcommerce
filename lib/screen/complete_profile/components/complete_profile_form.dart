import 'package:ecommerce/components/costum_suffix_icon.dart';
import 'package:ecommerce/components/error_form.dart';
import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/otp/otp_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameFormFied(),
          SizedBox(height: getPropScreenHeight(20)),
          lastNameFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          phoneNumberFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          addressFormField(),
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
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            }
          )
        ],
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
        onSaved: (newValue) => address = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kAddressNullError)) {
            setState(() {
              errors.remove(kAddressNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kAddressNullError)) {
            setState(() {
              errors.add(kAddressNullError);
            });
          }
        return null;
        },
        decoration: const InputDecoration(
          labelText: "Address",
          labelStyle: TextStyle(color: kPrimaryColor),
          hintText: "Enter your address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(icon: "assets/icons/Location point.svg")
        ),
      );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNumberNullError)) {
            setState(() {
              errors.remove(kNumberNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNumberNullError)) {
            setState(() {
              errors.add(kNumberNullError);
            });
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(color: kPrimaryColor),
          hintText: "Enter your phone number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(icon: "assets/icons/Phone.svg")
        ),
      );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Last Name",
          labelStyle: TextStyle(color: kPrimaryColor),
          hintText: "Enter your last name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(icon: "assets/icons/User.svg")
        ),
      );
  }

  TextFormField firstNameFormFied() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "First Name",
          labelStyle: TextStyle(color: kPrimaryColor),
          hintText: "Enter your first name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(icon: "assets/icons/User.svg")
        ),
      );
  }
}
