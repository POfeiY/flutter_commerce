import 'package:flutter/material.dart';
import 'package:flutter_commerce/components/custom_surfix_icon.dart';
import 'package:flutter_commerce/components/default_button.dart';
import 'package:flutter_commerce/components/form_error.dart';
import 'package:flutter_commerce/screens/complete_profile/complete_profile_screen.dart';

import 'package:flutter_commerce/size_config.dart';
import 'package:flutter_commerce/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if(!errors.contains(error)) setState(() {
      errors.add(error);
    });
  }
  void removeError({String error}) {
    if(errors.contains(error)) setState(() {
      errors.remove(error);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30),),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30),),
            buildConfirmPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(40),),
            FormError(errors: errors),
            DefaultButton(
              text: "Continue",
              press: () {
                if(_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              },
            )
          ],
        )
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if(value.isNotEmpty) {
          removeError(error: kPassNullError);
        }else if(value.isNotEmpty && value == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }else if(password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Lock.svg",)
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if(value.isNotEmpty) {
          removeError(error: kPassNullError);
        }else if(value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }else if(value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Lock.svg",)
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if(value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }else if(emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        password = value;
      },
      validator: (value) {
        if(value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }else if(value.length < 8) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfixIcon(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }

}
