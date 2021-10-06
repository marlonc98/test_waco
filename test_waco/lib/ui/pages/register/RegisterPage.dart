import 'package:flutter/material.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        body: Center(
      child: Text('Register'),
    ));
  }
}
