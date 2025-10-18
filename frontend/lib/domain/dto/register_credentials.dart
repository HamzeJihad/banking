import 'package:flutter/foundation.dart';

class RegisterCredentials extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }
}