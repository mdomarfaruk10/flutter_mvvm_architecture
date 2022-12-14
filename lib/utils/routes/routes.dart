import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../../view/home_screen.dart';
import '../../view/login_view.dart';
import '../../view/register_screen.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic>  generateRoute(RouteSettings settings) {
    final argum =settings.arguments;
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => Splash_Screen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => loginView());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => RegisterView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Route difined"),
            ),
          );
        });
    }
  }
}
