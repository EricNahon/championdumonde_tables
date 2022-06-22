import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'themes/themes.dart';
import 'core/routes.dart';
import 'core/constants.dart';
import 'core/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingletons();
  await Firebase.initializeApp();
  await appController.bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final router = Routes.routes;

    return MaterialApp.router(
      showPerformanceOverlay: false,
      title: Constants.webAppname,
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      themeMode: ThemeMode.dark,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('nl', ''),
        Locale('es', ''),
      ],
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
