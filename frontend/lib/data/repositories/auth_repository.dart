import 'package:dio/dio.dart';
import 'package:domain/domain.dart' hide Failure;
import 'package:flutter/foundation.dart';
import 'package:frontend/core/exceptions/exceptions.dart';
import 'package:frontend/core/extensions/result_extensions.dart';
import 'package:frontend/data/api/auth_api.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/data/services/storage_service.dart';
import 'package:frontend/domain/dto/credentials.dart';
import 'package:frontend/domain/dto/tokenization.dart';
import 'package:result_dart/result_dart.dart';

@Repository()
class AuthRepository {
  final StorageService _storageService;
  final AuthApi _authApi;
  final UserApi _userApi;

  final _isAuthenticated = ValueNotifier<bool>(false);
  ValueListenable<bool> get isAuthenticated => _isAuthenticated;
  AuthRepository(this._storageService, this._authApi, this._userApi);

  AsyncResult<UserDtoWithlessPassword> login(Credentials credentials) async {
    return _authApi
        .login(credentials.toBasic())
        .toAsyncResult()
        .mapError<Exception>((e) => AuthException('Failed to login'))
        .flatMap((tokenization) => _storageService.saveData(tokenization))
        .mapError<Exception>((e) => AuthException('Failed to save tokenization'))
        .flatMap(
          (_) => _userApi.getMe().toAsyncResult().mapError<Exception>(
            (e) => AuthException('Failed to get logged user'),
          ),
        );
  }

  AsyncResult<UserDtoWithlessPassword> getLoggedUser() async {
    return await _storageService
        .getData<Tokenization>()
        .mapError<Exception>((e) => AuthException('No logged user'))
        .flatMap(
          (tokenization) => _userApi.getMe().toAsyncResult().mapError<Exception>(
            (e) => e is DioException && e.response?.statusCode == 401
                ? AuthException('Unauthorized')
                : AuthException('Failed to get logged user'),
          ),
        )
        .onFailure((_) => _isAuthenticated.value = false)
        .onSuccess((_) => _isAuthenticated.value = true);
  }

  AsyncResult<Unit> logout() async {
    _isAuthenticated.value = false;
    return _storageService.delete<Tokenization>();
  }
}
