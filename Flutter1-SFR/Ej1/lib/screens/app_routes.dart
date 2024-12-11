import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'screens.dart';
import 'splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home_screen';
  static const String enlace1 = '/enlace1';
  static const String enlace2 = '/enlace2';
  static const String enlace3 = '/enlace3';
  static const String enlace4 = '/enlace4';
  static const String enlace5 = '/enlace5';
  static const String enlace6 = '/enlace6';
  static const String enlace7 = '/enlace7';
  static const String enlace9 = '/enlace9';
  static const String enlace10 = '/enlace10';
  static const String enlace11 = '/enlace11';
  static const String enlace12 = '/enlace12';

  static const String instagramHome = '/main_instagram';
  static const String lastFoot = '/last_foot_widget';
  static const String actionsWidget = '/actions_widget';
  static const String footerWidget = '/footer_widget';
  static const String headerWidget = '/header_widget';
  static const String gridViewWidget = '/grid_view_widget';
  static const String profileWidget = '/profile_widget';
  static const String rectanglesWidget = '/rectangles_widget';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    enlace1: (context) => const Enlace1(),
    enlace2: (context) => const Enlace2(),
    enlace3: (context) => const Enlace3(),
    enlace4: (context) => const Enlace4(),
    enlace5: (context) => const Enlace5(),
    enlace6: (context) => const Enlace6(),
    enlace7: (context) => const Enlace7(),
    enlace11: (context) => const Enlace11(),
    enlace12: (context) => Enlace12(),
    instagramHome: (context) => const Enlace8(),
    enlace9: (context) => const Enlace9(),
    enlace10: (context) => const Enlace10(),
  };
}
