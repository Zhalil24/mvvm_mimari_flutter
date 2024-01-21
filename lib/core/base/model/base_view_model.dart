import 'package:flutter/material.dart';

import '../../init/cache/local_manager.dart';
import '../../init/navigaiton/navigation_services.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

mixin BaseViewModel {
  BuildContext? buildContext;
  ICoreDio? coreDio = NetworkManager.instance.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationServices? navigation = NavigationServices.instance;

  void setContext(BuildContext context);
  void init();
}
