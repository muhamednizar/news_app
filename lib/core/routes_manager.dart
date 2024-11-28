import 'package:flutter/material.dart';
import 'package:news_app/presentetion/screens/splash/splash.dart';

import '../presentetion/screens/home/home.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
    }
  }
}
