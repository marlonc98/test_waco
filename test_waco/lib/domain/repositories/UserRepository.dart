
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
  Future<bool> logout();
  Future<User?> get();
}