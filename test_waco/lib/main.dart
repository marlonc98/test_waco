import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/drawer/DrawerProvider.dart';
import 'package:test_waco/domain/blocs/user/UserProvider.dart';
import 'package:test_waco/ui/pages/splash/SplashPage.dart';
import 'package:test_waco/ui/utils/route_generator.dart';

import 'domain/blocs/localizations/AppLocalizations.dart';
import 'domain/blocs/localizations/LocalizationProvider.dart';

void main() {
  WidgetsFlutterBinding();
  Firebase.initializeApp().then((value) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LocalizationProvider>(
                create: (_) => new LocalizationProvider()),
            ChangeNotifierProvider<UserProvider>(
                create: (_) => new UserProvider()),
            ChangeNotifierProvider<DrawerProvider>(
                create: (_) => new DrawerProvider()),
          ],
          child: MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          buttonColor: Colors.white,
          appBarTheme: AppBarTheme().copyWith(
              color: Colors.white,
              titleTextStyle: TextStyle(color: Colors.white))),
      initialRoute: SplashPage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
      supportedLocales: [
        const Locale('es', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      locale: Provider.of<LocalizationProvider>(context).locale,
    );
  }
}
