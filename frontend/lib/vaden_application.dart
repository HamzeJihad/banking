// GENERATED CODE - DO NOT MODIFY BY HAND
// Aggregated Vaden application file
// ignore_for_file: prefer_func  tion_declarations_over_variables, implementation_imports
import 'package:frontend/ui/auth/stores/auth_store.dart';
import 'package:frontend/core/config/api_configuration.dart';
import 'package:domain/domain.dart';
import 'package:domain/dtos/change_password_dto.dart';
import 'package:domain/dtos/create_user_dto.dart';
import 'package:domain/dtos/extract_dto.dart';
import 'package:domain/dtos/request_transfer_dto.dart';
import 'package:domain/dtos/response_extract_dto.dart';
import 'package:domain/dtos/user_dto.dart';
import 'package:domain/dtos/wallet_dto.dart';
import 'package:domain/dtos/response_message.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:frontend/data/api/auth_api.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/data/api/wallet_api.dart';
import 'package:frontend/data/services/storage_service.dart';
import 'package:frontend/domain/dto/tokenization.dart';
import 'package:frontend/ui/home/stores/home_store.dart';
import 'package:frontend/ui/splash/stores/splash_store.dart';

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dioPackage;
import 'package:flutter_vaden/flutter_vaden.dart';

late final AutoInjector _injector;

class VadenApp extends FlutterVadenApplication {
  @override
  AutoInjector get injector => _injector;

  VadenApp({required super.child, AutoInjector? injector}) {
    _injector = injector ?? AutoInjector();
  }

  @override
  Future<void> setup() async {
    final asyncBeans = <Future<void> Function()>[];
    _injector.addLazySingleton<DSON>(_DSON.new);
    _injector.addInstance<Injector>(_injector);

    _injector.addLazySingleton(AuthStore.new);

    final configurationDioConfiguration = DioConfiguration();

    _injector.addLazySingleton(configurationDioConfiguration.dio);

    _injector.addLazySingleton(AuthRepository.new);

    _injector.addLazySingleton<AuthApi>(_AuthApi.new);

    _injector.addLazySingleton<UserApi>(_UserApi.new);

    _injector.addLazySingleton<WalletApi>(_WalletApi.new);

    _injector.addLazySingleton(StorageService.new);

    _injector.addLazySingleton(HomeStore.new);

    _injector.addLazySingleton(SplashStore.new);

    _injector.commit();

    for (final asyncBean in asyncBeans) {
      await asyncBean();
    }
  }
}

class _DSON extends DSON {
  @override
  (
    Map<Type, FromJsonFunction>,
    Map<Type, ToJsonFunction>,
    Map<Type, ToOpenApiNormalMap>,
  )
  getMaps() {
    final fromJsonMap = <Type, FromJsonFunction>{};
    final toJsonMap = <Type, ToJsonFunction>{};
    final toOpenApiMap = <Type, ToOpenApiNormalMap>{};

    fromJsonMap[ChangePasswordDto] = (Map<String, dynamic> json) {
      return Function.apply(ChangePasswordDto.new, [], {
        #oldPassword: json['oldPassword'],
        #newPassword: json['newPassword'],
      });
    };
    toJsonMap[ChangePasswordDto] = (object) {
      final obj = object as ChangePasswordDto;
      return {'oldPassword': obj.oldPassword, 'newPassword': obj.newPassword};
    };
    toOpenApiMap[ChangePasswordDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "oldPassword": {"type": "string"},
        "newPassword": {"type": "string"},
      },
      "required": ["oldPassword", "newPassword"],
    };

    fromJsonMap[CreateUserDto] = (Map<String, dynamic> json) {
      return Function.apply(CreateUserDto.new, [], {
        #name: json['name'],
        #email: json['email'],
        #role: UserRole.values.byName(json['role'] as String),
        #password: json['password'],
      });
    };
    toJsonMap[CreateUserDto] = (object) {
      final obj = object as CreateUserDto;
      return {
        'name': obj.name,
        'email': obj.email,
        'role': obj.role.name,
        'password': obj.password,
      };
    };
    toOpenApiMap[CreateUserDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "name": {"type": "string"},
        "email": {"type": "string"},
        "role": {
          "type": "string",
          "enum": ["admin", "user", "guest"],
        },
        "password": {"type": "string"},
      },
      "required": ["name", "email", "role", "password"],
    };

    fromJsonMap[ExtractDto] = (Map<String, dynamic> json) {
      final runtimeType = json['runtimeType'] as String?;
      switch (runtimeType) {
        case 'ReceivedExtractDto':
          return fromJson<ReceivedExtractDto>(json);
        case 'SentExtractDto':
          return fromJson<SentExtractDto>(json);
        default:
          throw ArgumentError(
            'Unknown runtimeType for ExtractDto: $runtimeType',
          );
      }
    };
    toJsonMap[ExtractDto] = (object) {
      // Obtém o tipo real do objeto em runtime
      final objectType = object.runtimeType;
      switch (objectType) {
        case ReceivedExtractDto:
          return toJson<ReceivedExtractDto>(object as ReceivedExtractDto);
        case SentExtractDto:
          return toJson<SentExtractDto>(object as SentExtractDto);
        default:
          throw ArgumentError('Unknown subtype for ExtractDto: $objectType');
      }
    };
    toOpenApiMap[ExtractDto] = {
      "oneOf": [
        {r"$ref": "#/components/schemas/ReceivedExtractDto"},
        {r"$ref": "#/components/schemas/SentExtractDto"},
      ],
      "discriminator": {
        "propertyName": "runtimeType",
        "mapping": {
          "ReceivedExtractDto": "#/components/schemas/ReceivedExtractDto",
          "SentExtractDto": "#/components/schemas/SentExtractDto",
        },
      },
    };

    fromJsonMap[ReceivedExtractDto] = (Map<String, dynamic> json) {
      return Function.apply(ReceivedExtractDto.new, [], {
        #from: json['from'],
        #transactionDate: DateTime.parse(json['transactionDate'] as String),
        #amount: DecimalParse().fromJson(json['amount']),
      });
    };
    toJsonMap[ReceivedExtractDto] = (object) {
      final obj = object as ReceivedExtractDto;
      return {
        'runtimeType': 'ReceivedExtractDto',
        'transactionDate': obj.transactionDate.toIso8601String(),
        'amount': DecimalParse().toJson(obj.amount),
        'from': obj.from,
      };
    };
    toOpenApiMap[ReceivedExtractDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "transactionDate": {"type": "string", "format": "date-time"},
        "amount": {"type": "string"},
        "from": {"type": "string"},
      },
      "required": ["transactionDate", "amount", "from"],
    };

    fromJsonMap[SentExtractDto] = (Map<String, dynamic> json) {
      return Function.apply(SentExtractDto.new, [], {
        #to: json['to'],
        #transactionDate: DateTime.parse(json['transactionDate'] as String),
        #amount: DecimalParse().fromJson(json['amount']),
      });
    };
    toJsonMap[SentExtractDto] = (object) {
      final obj = object as SentExtractDto;
      return {
        'runtimeType': 'SentExtractDto',
        'transactionDate': obj.transactionDate.toIso8601String(),
        'amount': DecimalParse().toJson(obj.amount),
        'to': obj.to,
      };
    };
    toOpenApiMap[SentExtractDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "transactionDate": {"type": "string", "format": "date-time"},
        "amount": {"type": "string"},
        "to": {"type": "string"},
      },
      "required": ["transactionDate", "amount", "to"],
    };

    fromJsonMap[RequestTransferDto] = (Map<String, dynamic> json) {
      return Function.apply(RequestTransferDto.new, [], {
        #toWalletId: json['toWalletId'],
        #amount: DecimalParse().fromJson(json['amount']),
      });
    };
    toJsonMap[RequestTransferDto] = (object) {
      final obj = object as RequestTransferDto;
      return {
        'toWalletId': obj.toWalletId,
        'amount': DecimalParse().toJson(obj.amount),
      };
    };
    toOpenApiMap[RequestTransferDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "toWalletId": {"type": "integer"},
        "amount": {"type": "string"},
      },
      "required": ["toWalletId", "amount"],
    };

    fromJsonMap[ResponseExtractDto] = (Map<String, dynamic> json) {
      return Function.apply(ResponseExtractDto.new, [], {
        #extracts: fromJsonList<ExtractDto>(json['extracts']),
        #currentPage: json['currentPage'],
        #nextPage: json['nextPage'],
      });
    };
    toJsonMap[ResponseExtractDto] = (object) {
      final obj = object as ResponseExtractDto;
      return {
        'extracts': toJsonList<ExtractDto>(obj.extracts),
        'currentPage': obj.currentPage,
        'nextPage': obj.nextPage,
      };
    };
    toOpenApiMap[ResponseExtractDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "extracts": {
          "type": "array",
          "items": {r"$ref": "#/components/schemas/ExtractDto"},
        },
        "currentPage": {"type": "integer"},
        "nextPage": {"type": "integer"},
      },
      "required": ["extracts", "currentPage"],
    };

    fromJsonMap[UserDto] = (Map<String, dynamic> json) {
      final runtimeType = json['runtimeType'] as String?;
      switch (runtimeType) {
        case 'UserDtoWithlessPassword':
          return fromJson<UserDtoWithlessPassword>(json);
        case 'UserDtoWithPassword':
          return fromJson<UserDtoWithPassword>(json);
        default:
          throw ArgumentError('Unknown runtimeType for UserDto: $runtimeType');
      }
    };
    toJsonMap[UserDto] = (object) {
      // Obtém o tipo real do objeto em runtime
      final objectType = object.runtimeType;
      switch (objectType) {
        case UserDtoWithlessPassword:
          return toJson<UserDtoWithlessPassword>(
            object as UserDtoWithlessPassword,
          );
        case UserDtoWithPassword:
          return toJson<UserDtoWithPassword>(object as UserDtoWithPassword);
        default:
          throw ArgumentError('Unknown subtype for UserDto: $objectType');
      }
    };
    toOpenApiMap[UserDto] = {
      "oneOf": [
        {r"$ref": "#/components/schemas/UserDtoWithlessPassword"},
        {r"$ref": "#/components/schemas/UserDtoWithPassword"},
      ],
      "discriminator": {
        "propertyName": "runtimeType",
        "mapping": {
          "UserDtoWithlessPassword":
              "#/components/schemas/UserDtoWithlessPassword",
          "UserDtoWithPassword": "#/components/schemas/UserDtoWithPassword",
        },
      },
    };

    fromJsonMap[UserDtoWithPassword] = (Map<String, dynamic> json) {
      return Function.apply(UserDtoWithPassword.new, [], {
        #id: json['id'],
        #email: json['email'],
        #name: json['name'],
        #password: json['password'],
        #role: UserRole.values.byName(json['role'] as String),
      });
    };
    toJsonMap[UserDtoWithPassword] = (object) {
      final obj = object as UserDtoWithPassword;
      return {
        'runtimeType': 'UserDtoWithPassword',
        'id': obj.id,
        'email': obj.email,
        'name': obj.name,
        'password': obj.password,
        'role': obj.role.name,
      };
    };
    toOpenApiMap[UserDtoWithPassword] = {
      "type": "object",
      "properties": <String, dynamic>{
        "id": {"type": "integer"},
        "email": {"type": "string"},
        "name": {"type": "string"},
        "password": {"type": "string"},
        "role": {
          "type": "string",
          "enum": ["admin", "user", "guest"],
        },
      },
      "required": ["id", "email", "name", "password", "role"],
    };

    fromJsonMap[UserDtoWithlessPassword] = (Map<String, dynamic> json) {
      return Function.apply(UserDtoWithlessPassword.new, [], {
        #id: json['id'],
        #email: json['email'],
        #name: json['name'],
        #role: UserRole.values.byName(json['role'] as String),
      });
    };
    toJsonMap[UserDtoWithlessPassword] = (object) {
      final obj = object as UserDtoWithlessPassword;
      return {
        'runtimeType': 'UserDtoWithlessPassword',
        'id': obj.id,
        'email': obj.email,
        'name': obj.name,
        'role': obj.role.name,
      };
    };
    toOpenApiMap[UserDtoWithlessPassword] = {
      "type": "object",
      "properties": <String, dynamic>{
        "id": {"type": "integer"},
        "email": {"type": "string"},
        "name": {"type": "string"},
        "role": {
          "type": "string",
          "enum": ["admin", "user", "guest"],
        },
      },
      "required": ["id", "email", "name", "role"],
    };

    fromJsonMap[WalletDto] = (Map<String, dynamic> json) {
      return Function.apply(WalletDto.new, [], {
        #id: json['id'],
        #balance: DecimalParse().fromJson(json['balance']),
        #userId: json['userId'],
      });
    };
    toJsonMap[WalletDto] = (object) {
      final obj = object as WalletDto;
      return {
        'id': obj.id,
        'balance': DecimalParse().toJson(obj.balance),
        'userId': obj.userId,
      };
    };
    toOpenApiMap[WalletDto] = {
      "type": "object",
      "properties": <String, dynamic>{
        "id": {"type": "integer"},
        "balance": {"type": "string"},
        "userId": {"type": "integer"},
      },
      "required": ["id", "balance", "userId"],
    };

    fromJsonMap[ResponseMessage] = (Map<String, dynamic> json) {
      return Function.apply(ResponseMessage.new, [json['message']], {});
    };
    toJsonMap[ResponseMessage] = (object) {
      final obj = object as ResponseMessage;
      return {'message': obj.message};
    };
    toOpenApiMap[ResponseMessage] = {
      "type": "object",
      "properties": <String, dynamic>{
        "message": {"type": "string"},
      },
      "required": ["message"],
    };

    fromJsonMap[Tokenization] = (Map<String, dynamic> json) {
      return Function.apply(Tokenization.new, [], {
        #accessToken: json['access_token'],
        #refreshToken: json['refresh_token'],
      });
    };
    toJsonMap[Tokenization] = (object) {
      final obj = object as Tokenization;
      return {
        'access_token': obj.accessToken,
        'refresh_token': obj.refreshToken,
      };
    };
    toOpenApiMap[Tokenization] = {
      "type": "object",
      "properties": <String, dynamic>{
        "access_token": {"type": "string"},
        "refresh_token": {"type": "string"},
      },
      "required": ["access_token", "refresh_token"],
    };

    return (fromJsonMap, toJsonMap, toOpenApiMap);
  }
}

class _AuthApi implements AuthApi {
  final DSON dson;

  _AuthApi(this.dson);

  @override
  Future<Tokenization> login(String authorization) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/auth/login',
      options: dioPackage.Options(
        method: 'GET',
        headers: {'Authorization': authorization},
      ),
    );
    return dson.fromJson<Tokenization>(response.data);
  }

  @override
  Future<Tokenization> refresh(String authorization) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/auth/refresh',
      options: dioPackage.Options(
        method: 'GET',
        headers: {'Authorization': authorization},
      ),
    );
    return dson.fromJson<Tokenization>(response.data);
  }
}

class _UserApi implements UserApi {
  final DSON dson;

  _UserApi(this.dson);

  @override
  Future<UserDto> createUser(String createUser, CreateUserDto user) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/users/create',
      options: dioPackage.Options(method: 'POST'),
      data: dson.toJson<CreateUserDto>(user),
    );
    return dson.fromJson<UserDto>(response.data);
  }

  @override
  Future<ResponseMessage> changePassword(
    ChangePasswordDto changePassword,
    UserDtoWithPassword user,
  ) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/users/change-password',
      options: dioPackage.Options(method: 'POST'),
      data: dson.toJson<ChangePasswordDto>(changePassword),
    );
    return dson.fromJson<ResponseMessage>(response.data);
  }

  @override
  Future<UserDtoWithlessPassword> getMe() async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/users/me',
      options: dioPackage.Options(method: 'GET'),
    );
    return dson.fromJson<UserDtoWithlessPassword>(response.data);
  }
}

class _WalletApi implements WalletApi {
  final DSON dson;

  _WalletApi(this.dson);

  @override
  Future<WalletDto> getWalletsByUserId() async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/wallet/byUser',
      options: dioPackage.Options(method: 'GET'),
    );
    return dson.fromJson<WalletDto>(response.data);
  }

  @override
  Future<ResponseMessage> transferFunds(
    RequestTransferDto requestTransfer,
  ) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/wallet/transfer',
      options: dioPackage.Options(method: 'POST'),
      data: dson.toJson<RequestTransferDto>(requestTransfer),
    );
    return dson.fromJson<ResponseMessage>(response.data);
  }

  @override
  Future<ResponseExtractDto> getExtracts(int page, int walletId) async {
    final dio = _injector.tryGet<dioPackage.Dio>() ?? dioPackage.Dio();
    final response = await dio.request(
      '/wallet/extracts/$page/$walletId',
      options: dioPackage.Options(method: 'GET'),
    );
    return dson.fromJson<ResponseExtractDto>(response.data);
  }
}
