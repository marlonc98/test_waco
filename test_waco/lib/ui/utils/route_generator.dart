import 'package:flutter/material.dart';
import 'package:test_waco/ui/pages/home/HomePage.dart';
import 'package:test_waco/ui/pages/login/LoginPage.dart';
import 'package:test_waco/ui/pages/posts/PostPage.dart';
import 'package:test_waco/ui/pages/register/RegisterPage.dart';
import 'package:test_waco/ui/pages/splash/SplashPage.dart';
import 'package:test_waco/ui/pages/webview/WebViewPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => HomePage());
      case LoginPage.route:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RegisterPage.route:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case PostPage.route:
        return MaterialPageRoute(builder: (_) => PostPage());
      case WebViewPage.route:
        WebViewPage args2 = args as WebViewPage;
        return MaterialPageRoute(builder: (_) => args2);
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
