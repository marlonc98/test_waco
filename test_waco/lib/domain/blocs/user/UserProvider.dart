import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_waco/domain/repositories/UserRepository.dart';

class UserProvider with ChangeNotifier implements UserRepository {
  User? _user;
  User? get user => _user;

  set user(User? user) {
    this._user = user;
    notifyListeners();
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = credential.user;
    } catch (err) {
      _user = null;
    }
    notifyListeners();
    return _user;
  }

  @override
  Future<User?> register(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = credential.user;
    } catch (err) {
      _user = null;
    }
    notifyListeners();
    return _user;
  }

  @override
  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut().then((value) => _user = null);
    notifyListeners();
    return _user == null;
  }

  @override
  Future<User?> get() async {
    User? user = FirebaseAuth.instance.currentUser;
    this._user = user;
    notifyListeners();
    return user;
  }
}
