abstract class BankingException implements Exception {
  final String message;
  final StackTrace? stackTrace;   
  BankingException(this.message, [this.stackTrace]);

  @override
  String toString() {
    final className = runtimeType.toString();
    return '$className: $message\n${stackTrace ?? ''}';
  }
}

class AuthException extends BankingException {
  AuthException(super.message, [super.stackTrace]);
}
