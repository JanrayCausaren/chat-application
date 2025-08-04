import 'package:chat_application/features/auth/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  
  String _passwordMessage = 'Password must be at least 6 characters';
  String get passwordMessage => _passwordMessage;

  void validatePassword(String value) {
    if (value.length < 6) {
      _passwordMessage = 'Password must be at least 6 characters';
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      _passwordMessage = 'Include at least one special character';
    } else {
      _passwordMessage = '✅ Password looks good!';
    }
    notifyListeners();
  }

  String? validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (email.contains('@')) return 'Enter a valid email';
    return null;
  }

  // String? validatePassword(String password) {
  //   if (password.isEmpty) return 'password is required';
  //   if (password.length < 6) return 'Password must be at least 6 characters';
  //   return null;
  // }

  Future<bool> login(String email, String password) async {
    UserModel user = UserModel(email: email, password: password);
    return true;
  }
}
