import 'package:domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/extensions/result_extensions.dart';
import 'package:frontend/data/api/auth_api.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:frontend/data/services/storage_service.dart';
import 'package:frontend/domain/dto/tokenization.dart';
import 'package:result_dart/result_dart.dart';

@Configuration()
class DioConfiguration {
  @Bean()
  Dio dio(StorageService storageService, AuthApi authApi, AuthRepository authRepository) {
    final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(AuthInterceptor(storageService, authApi, authRepository));
    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  final StorageService _storageService;
  final AuthApi _authApi;
  final AuthRepository _authRepository;

  AuthInterceptor(this._storageService, this._authApi, this._authRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storageService.getData<Tokenization>().getOrNull();

    if (token != null && options.headers['Authorization'] == null && options.headers['create-user'] != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _storageService
          .getData<Tokenization>()
          .flatMap((tokenization) => _authApi.refresh('Bearer ${tokenization.refreshToken}').toAsyncResult())
          .flatMap((newTokenization) => _storageService.saveData(newTokenization))
          .fold(
            (token) async {
              _newTokenResolver(token, err.requestOptions, handler, err);
            },
            (e) {
              _authRepository.logout();
              handler.reject(err);
            },
          );
    }
  }

  Future<void> _newTokenResolver(
    Tokenization token,
    RequestOptions options,
    ErrorInterceptorHandler handler,
    DioException err,
  ) async {
    options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    try {
      final response = await Dio().fetch(options);
      handler.resolve(response);
    } catch (e) {
      handler.reject(err);
    }
  }
}
