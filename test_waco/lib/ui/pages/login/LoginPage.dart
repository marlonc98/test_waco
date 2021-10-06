import 'package:flutter/material.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        body: Center(
      child: Text('login'),
    ));
  }
}
