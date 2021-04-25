import 'package:flutter/material.dart';

import 'package:flutter_commerce/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'specical_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20),),
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(10),),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenHeight(30),),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30),)
        ],
      ),
    ));
  }
}
