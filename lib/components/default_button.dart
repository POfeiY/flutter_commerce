import 'package:flutter/material.dart';

import 'package:flutter_commerce/constants.dart';
import 'package:flutter_commerce/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press
}):super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(56),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.resolveWith((states) => (kPrimaryColor)),
          shape: MaterialStateProperty.all(StadiumBorder())
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
