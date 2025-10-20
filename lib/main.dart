import 'package:flutter/material.dart';
import 'package:todo_app/core/router/app_router.dart';

import 'core/themes/theme_manager.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppThemes.appThemeData[AppTheme.lightTheme],
      darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
      routerConfig: di.sl<AppRouter>().router,
    );
  }
}
