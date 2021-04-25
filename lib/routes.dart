import 'package:flutter/widgets.dart';
import 'package:flutter_commerce/screens/cart/cart_screen.dart';
import 'package:flutter_commerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_commerce/screens/details/details_screen.dart';
import 'package:flutter_commerce/screens/forget_password/forget_password_screen.dart';
import 'package:flutter_commerce/screens/home/home_screen.dart';
import 'package:flutter_commerce/screens/login_success/login_success_screen.dart';
import 'package:flutter_commerce/screens/otp/otp_screen.dart';
import 'package:flutter_commerce/screens/profile/profile_screen.dart';
import 'package:flutter_commerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_commerce/screens/splash/splash.screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
