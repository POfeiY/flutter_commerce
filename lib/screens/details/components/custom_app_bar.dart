import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_commerce/size_config.dart';

// PreferredSize
// 此控件不对其子控件施加任何约束，并且不以任何方式影响孩子的布局。
// 常用来自定义AppBar和AppBar.bottom（PreferredSize子控件为AppBar或者AppBar.bottom）
class CustomAppBar extends PreferredSize {
  final double rating;
  CustomAppBar({
    @required this.rating
});
  
  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
          child: Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 15,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Row(
                  children: [
                    Text(
                      "$rating",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(width: 5,),
                    SvgPicture.asset("assets/icons/Star Icon.svg")
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
