import 'package:flutter/material.dart';

import 'INavigationService.dart';

class NavigationServices implements INavigatorServices {
  static NavigationServices? _instance = NavigationServices._init();
  static NavigationServices? get instance => _instance;

  NavigationServices._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, required Object data}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
