import 'package:flutter/material.dart';
import 'package:test_waco/domain/entities/User.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  set user(User? user) {
    this._user = user;
    notifyListeners();
  }

  void logout(){}
}
