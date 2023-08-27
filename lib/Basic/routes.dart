import 'package:fbclub/main_screen.dart';
import 'package:flutter/material.dart';

import '../Login/login_screen.dart';
import '../splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};