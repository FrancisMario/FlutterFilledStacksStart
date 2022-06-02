// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:wcx/core/router_constants.dart';

import 'package:wcx/views/main/main_view.dart' as view0;
import 'package:wcx/views/start_up/start_up_view.dart' as view1;
import 'package:wcx/views/login/login_view.dart' as view2;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainViewRoute:
        return MaterialPageRoute(builder: (_) => view0.MainView());
      case startUpViewRoute:
        return MaterialPageRoute(builder: (_) => view1.StartUpView());
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view2.LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}