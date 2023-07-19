import 'package:fbclub/init_screen.dart';
import 'package:flutter/material.dart';

import '../basic/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
};