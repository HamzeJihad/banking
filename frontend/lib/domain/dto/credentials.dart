import 'dart:convert';

import 'package:flutter/material.dart';

class Credentials extends ChangeNotifier {
   String _email;
   String _password;

  Credentials({String email = '', String password = ''})
      : _email = email,
        _password = password;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get email => _email; 
  String get password => _password;

  String toBasic() {
    final credentials = '$_email:$_password';
    final bytes = utf8.encode(credentials);
    final base64Str = base64.encode(bytes);
    return 'Basic $base64Str';
  }
}
