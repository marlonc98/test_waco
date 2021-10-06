import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/DrawerProvider.dart';
import 'package:test_waco/domain/blocs/UserProvider.dart';
import 'package:test_waco/ui/pages/home/HomePage.dart';
import 'package:test_waco/ui/utils/route_generator.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => new UserProvider()),
        ChangeNotifierProvider<DrawerProvider>(
            create: (_) => new DrawerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        buttonColor: Colors.white,
          appBarTheme: AppBarTheme().copyWith(
              color: Colors.white,
              titleTextStyle: TextStyle(color: Colors.white))),
      initialRoute: HomePage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
