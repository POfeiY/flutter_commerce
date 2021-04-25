import 'package:flutter/material.dart';
import 'package:flutter_commerce/routes.dart';
import 'package:flutter_commerce/screens/splash/splash.screen.dart';
import 'package:flutter_commerce/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Commerce",
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
