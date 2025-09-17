import 'package:result_dart/result_dart.dart';

extension FutureResultExtensions<T extends Object> on Future<T> {
  AsyncResult<T> toAsyncResult() async {
    return then(
      (value) => Success(value),
      onError: (e, s) {
        return Failure(e);
      },
    );
  }
}
