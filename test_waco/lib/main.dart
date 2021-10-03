import 'package:flutter/material.dart';
import 'package:test_waco/ui/pages/MyHomePage.dart';
import 'package:test_waco/ui/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
