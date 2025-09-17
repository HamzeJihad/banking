import 'dart:convert';

class Credentials {
  final String email;
  final String password;

  Credentials({
    required this.email,
    required this.password,
  });

  String toBasic(){
    final credentials = '$email:$password';
    final bytes = utf8.encode(credentials);
    final base64Str = base64.encode(bytes);
    return 'Basic $base64Str';
  }
}