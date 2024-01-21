import 'package:flutter/material.dart';
import 'package:flutter_application_mivvm_mimari/view/authenticate/login/view/login_view.dart';
import 'package:flutter_application_mivvm_mimari/view/authenticate/onboard/view/on_board_view.dart';
import 'package:flutter_application_mivvm_mimari/view/home/build/feed/view/build_feed_view.dart';

import 'core/init/navigaiton/navigation_services.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'core/init/cache/local_manager.dart';
import 'core/init/navigaiton/navigaiton_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.prefrencesInit();

  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: LoginView(),
      onGenerateRoute: NavigatorRoute.instance?.generateRoute,
      navigatorKey: NavigationServices.instance?.navigatorKey,
    );
  }
}
