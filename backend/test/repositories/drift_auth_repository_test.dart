

import 'package:test/test.dart';
import 'package:vaden_security/vaden_security.dart';

void main(){
  test('drift auth repository', () {
   final enconder = BCryptPasswordEncoder(cost: 10);

   final password = 'mysercurepassword';
   final hashedPassword = enconder.encode(password);
   expect(enconder.matches(password, hashedPassword), isTrue);
  });
}