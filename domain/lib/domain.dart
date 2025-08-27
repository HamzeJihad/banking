// DTOs exports
import 'package:vaden_core/vaden_core.dart';

import 'dtos/change_password_dto.dart';
import 'dtos/create_user_dto.dart';
import 'dtos/credentials_dto.dart';
import 'dtos/extract_dto.dart';
import 'dtos/request_extract_dto.dart';
import 'dtos/request_transfer_dto.dart';
import 'dtos/response_extract_dto.dart';
import 'dtos/user_dto.dart';
import 'dtos/wallet_dto.dart';

export 'dtos/change_password_dto.dart';
export 'dtos/create_user_dto.dart';
export 'dtos/credentials_dto.dart';
export 'dtos/extract_dto.dart';
export 'dtos/request_extract_dto.dart';
export 'dtos/request_transfer_dto.dart';
export 'dtos/response_extract_dto.dart';
export 'dtos/user_dto.dart';
export 'dtos/wallet_dto.dart';

// Parses exports
export 'package:decimal/decimal.dart';
export 'package:vaden_core/vaden_core.dart';

// Entities exports
export 'entities/transaction_entity.dart';
export 'entities/user_entity.dart';
export 'entities/wallet_entity.dart';

// Repositories exports
export 'repositories/user_repository.dart';
export 'repositories/wallet_repository.dart';

@VadenModule([
  ChangePasswordDto,
  CreateUserDto,
  CredentialsDto,
  ExtractDto,
  ReceivedExtractDto,
  SentExtractDto,
  RequestExtractDto,
  RequestTransferDto,
  ResponseExtractDto,
  UserDto,
  WalletDto,
])
class DomainModule {}
