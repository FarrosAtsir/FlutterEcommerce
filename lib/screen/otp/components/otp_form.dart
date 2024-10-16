import 'package:ecommerce/components/my_default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen/home/home_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key,});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> otp = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              otp.length, 
              (index)=>OtpField(
                index: index, 
                mContext: context, 
                otp: otp
              )
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.15),
          MyDefaultButton(
            text: "Continue", 
            press: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print("${otp.join()}");
              }
              if (otp.isNotEmpty) {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            }
          )
        ],
      )
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({super.key, required this.index, required this.mContext, required this.otp,});

  final int index;
  final BuildContext mContext;
  final List<String?> otp;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(60),
      child: TextFormField(
        onSaved: (newValue) => setState(() => widget.otp[widget.index]=newValue),
        onChanged: (value){
          if (value.isEmpty && widget.index > 0) {
            FocusScope.of(context).previousFocus();
          }else if(widget.index == widget.otp.length - 1){
            FocusScope.of(context).unfocus();
          }else if(value.isEmpty && widget.index == 0){
            FocusScope.of(context).requestFocus();
          }else{
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value){
          if (value!.isEmpty) {
            return "";
          }
        },
        keyboardType: TextInputType.number,
        obscureText: true,
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (
          context, {
            required currentLength, 
            required isFocused, 
            required maxLength
          }
        ) => null,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        decoration: otpDecoration,
      ),
    );
  }
}