
import 'package:backend/src/domain.dart';

import '../../../config/drift/drift_configuration.dart';

extension UserTableX on UserTableData {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      role: UserRole.values.firstWhere((e) => e.name == role),
      createdAt: createdAt,
      updatedAt: updatedAt,
      password: password,
    );
  }
}
