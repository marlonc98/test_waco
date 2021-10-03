import 'package:flutter/material.dart';
import 'package:test_waco/ui/pages/MyHomePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case MyHomePage.route:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'title'));
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'title'));
    }
  }
}
