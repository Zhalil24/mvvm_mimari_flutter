import 'package:flutter/material.dart';

import '../../../view/authenticate/test/view/test_view.dart';
import '../../constans/navigation/navigation_contans.dart';

class NavigatorRoute {
  static NavigatorRoute? _instance = NavigatorRoute._init();
  static NavigatorRoute? get instance => _instance;

  NavigatorRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Text("Not Found"),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
