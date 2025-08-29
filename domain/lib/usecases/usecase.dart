/// Base class for all use cases
///
/// A use case represents a single business operation that can be performed by the application.
/// It encapsulates the business logic and orchestrates the interaction between entities and repositories.
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Type> call();
}

/// Represents a failure that can occur during use case execution
abstract class Failure {
  final String message;
  const Failure(this.message);
}


/// Common failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}

class InsufficientFundsFailure extends Failure {
  const InsufficientFundsFailure(super.message);
}
