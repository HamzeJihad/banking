// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_configuration.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    password,
    role,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserTableData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      role: Value(role),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserTableData copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, password, role, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required String role,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       email = Value(email),
       password = Value(password),
       role = Value(role);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? role,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String>? password,
    Value<String>? role,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WalletTableTable extends WalletTable
    with TableInfo<$WalletTableTable, WalletTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_table (id)',
    ),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<String> balance = GeneratedColumn<String>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    balance,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wallet_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WalletTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WalletTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WalletTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}balance'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WalletTableTable createAlias(String alias) {
    return $WalletTableTable(attachedDatabase, alias);
  }
}

class WalletTableData extends DataClass implements Insertable<WalletTableData> {
  final int id;
  final int userId;
  final String balance;
  final DateTime createdAt;
  final DateTime updatedAt;
  const WalletTableData({
    required this.id,
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['balance'] = Variable<String>(balance);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WalletTableCompanion toCompanion(bool nullToAbsent) {
    return WalletTableCompanion(
      id: Value(id),
      userId: Value(userId),
      balance: Value(balance),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WalletTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WalletTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      balance: serializer.fromJson<String>(json['balance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'balance': serializer.toJson<String>(balance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WalletTableData copyWith({
    int? id,
    int? userId,
    String? balance,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => WalletTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    balance: balance ?? this.balance,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WalletTableData copyWithCompanion(WalletTableCompanion data) {
    return WalletTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      balance: data.balance.present ? data.balance.value : this.balance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WalletTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('balance: $balance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, balance, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WalletTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.balance == this.balance &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WalletTableCompanion extends UpdateCompanion<WalletTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> balance;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const WalletTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.balance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WalletTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String balance,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       balance = Value(balance);
  static Insertable<WalletTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? balance,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (balance != null) 'balance': balance,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WalletTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? balance,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return WalletTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (balance.present) {
      map['balance'] = Variable<String>(balance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('balance: $balance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionTableTable extends TransactionTable
    with TableInfo<$TransactionTableTable, TransactionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_table (id)',
    ),
  );
  static const VerificationMeta _toWalletIdMeta = const VerificationMeta(
    'toWalletId',
  );
  @override
  late final GeneratedColumn<int> toWalletId = GeneratedColumn<int>(
    'to_wallet_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES wallet_table (id)',
    ),
  );
  static const VerificationMeta _fromWalletIdMeta = const VerificationMeta(
    'fromWalletId',
  );
  @override
  late final GeneratedColumn<int> fromWalletId = GeneratedColumn<int>(
    'from_wallet_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES wallet_table (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    toWalletId,
    fromWalletId,
    amount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('to_wallet_id')) {
      context.handle(
        _toWalletIdMeta,
        toWalletId.isAcceptableOrUnknown(
          data['to_wallet_id']!,
          _toWalletIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toWalletIdMeta);
    }
    if (data.containsKey('from_wallet_id')) {
      context.handle(
        _fromWalletIdMeta,
        fromWalletId.isAcceptableOrUnknown(
          data['from_wallet_id']!,
          _fromWalletIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fromWalletIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      toWalletId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_wallet_id'],
      )!,
      fromWalletId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_wallet_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TransactionTableTable createAlias(String alias) {
    return $TransactionTableTable(attachedDatabase, alias);
  }
}

class TransactionTableData extends DataClass
    implements Insertable<TransactionTableData> {
  final int id;
  final int userId;
  final int toWalletId;
  final int fromWalletId;
  final String amount;
  final DateTime createdAt;
  const TransactionTableData({
    required this.id,
    required this.userId,
    required this.toWalletId,
    required this.fromWalletId,
    required this.amount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['to_wallet_id'] = Variable<int>(toWalletId);
    map['from_wallet_id'] = Variable<int>(fromWalletId);
    map['amount'] = Variable<String>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionTableCompanion(
      id: Value(id),
      userId: Value(userId),
      toWalletId: Value(toWalletId),
      fromWalletId: Value(fromWalletId),
      amount: Value(amount),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      toWalletId: serializer.fromJson<int>(json['toWalletId']),
      fromWalletId: serializer.fromJson<int>(json['fromWalletId']),
      amount: serializer.fromJson<String>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'toWalletId': serializer.toJson<int>(toWalletId),
      'fromWalletId': serializer.toJson<int>(fromWalletId),
      'amount': serializer.toJson<String>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionTableData copyWith({
    int? id,
    int? userId,
    int? toWalletId,
    int? fromWalletId,
    String? amount,
    DateTime? createdAt,
  }) => TransactionTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    toWalletId: toWalletId ?? this.toWalletId,
    fromWalletId: fromWalletId ?? this.fromWalletId,
    amount: amount ?? this.amount,
    createdAt: createdAt ?? this.createdAt,
  );
  TransactionTableData copyWithCompanion(TransactionTableCompanion data) {
    return TransactionTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      toWalletId: data.toWalletId.present
          ? data.toWalletId.value
          : this.toWalletId,
      fromWalletId: data.fromWalletId.present
          ? data.fromWalletId.value
          : this.fromWalletId,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('toWalletId: $toWalletId, ')
          ..write('fromWalletId: $fromWalletId, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, toWalletId, fromWalletId, amount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.toWalletId == this.toWalletId &&
          other.fromWalletId == this.fromWalletId &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt);
}

class TransactionTableCompanion extends UpdateCompanion<TransactionTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> toWalletId;
  final Value<int> fromWalletId;
  final Value<String> amount;
  final Value<DateTime> createdAt;
  const TransactionTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.toWalletId = const Value.absent(),
    this.fromWalletId = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransactionTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int toWalletId,
    required int fromWalletId,
    required String amount,
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       toWalletId = Value(toWalletId),
       fromWalletId = Value(fromWalletId),
       amount = Value(amount);
  static Insertable<TransactionTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? toWalletId,
    Expression<int>? fromWalletId,
    Expression<String>? amount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (toWalletId != null) 'to_wallet_id': toWalletId,
      if (fromWalletId != null) 'from_wallet_id': fromWalletId,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransactionTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? toWalletId,
    Value<int>? fromWalletId,
    Value<String>? amount,
    Value<DateTime>? createdAt,
  }) {
    return TransactionTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      toWalletId: toWalletId ?? this.toWalletId,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (toWalletId.present) {
      map['to_wallet_id'] = Variable<int>(toWalletId.value);
    }
    if (fromWalletId.present) {
      map['from_wallet_id'] = Variable<int>(fromWalletId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('toWalletId: $toWalletId, ')
          ..write('fromWalletId: $fromWalletId, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $WalletTableTable walletTable = $WalletTableTable(this);
  late final $TransactionTableTable transactionTable = $TransactionTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userTable,
    walletTable,
    transactionTable,
  ];
}

typedef $$UserTableTableCreateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      required String name,
      required String email,
      required String password,
      required String role,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserTableTableUpdateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> email,
      Value<String> password,
      Value<String> role,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$UserTableTableReferences
    extends BaseReferences<_$AppDatabase, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WalletTableTable, List<WalletTableData>>
  _walletTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.walletTable,
    aliasName: $_aliasNameGenerator(db.userTable.id, db.walletTable.userId),
  );

  $$WalletTableTableProcessedTableManager get walletTableRefs {
    final manager = $$WalletTableTableTableManager(
      $_db,
      $_db.walletTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_walletTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionTableTable, List<TransactionTableData>>
  _transactionTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactionTable,
    aliasName: $_aliasNameGenerator(
      db.userTable.id,
      db.transactionTable.userId,
    ),
  );

  $$TransactionTableTableProcessedTableManager get transactionTableRefs {
    final manager = $$TransactionTableTableTableManager(
      $_db,
      $_db.transactionTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> walletTableRefs(
    Expression<bool> Function($$WalletTableTableFilterComposer f) f,
  ) {
    final $$WalletTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableFilterComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionTableRefs(
    Expression<bool> Function($$TransactionTableTableFilterComposer f) f,
  ) {
    final $$TransactionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTableTableFilterComposer(
            $db: $db,
            $table: $db.transactionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> walletTableRefs<T extends Object>(
    Expression<T> Function($$WalletTableTableAnnotationComposer a) f,
  ) {
    final $$WalletTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableAnnotationComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionTableRefs<T extends Object>(
    Expression<T> Function($$TransactionTableTableAnnotationComposer a) f,
  ) {
    final $$TransactionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTableTable,
          UserTableData,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (UserTableData, $$UserTableTableReferences),
          UserTableData,
          PrefetchHooks Function({
            bool walletTableRefs,
            bool transactionTableRefs,
          })
        > {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                name: name,
                email: email,
                password: password,
                role: role,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String email,
                required String password,
                required String role,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                name: name,
                email: email,
                password: password,
                role: role,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({walletTableRefs = false, transactionTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (walletTableRefs) db.walletTable,
                    if (transactionTableRefs) db.transactionTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (walletTableRefs)
                        await $_getPrefetchedData<
                          UserTableData,
                          $UserTableTable,
                          WalletTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableTableReferences
                              ._walletTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).walletTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transactionTableRefs)
                        await $_getPrefetchedData<
                          UserTableData,
                          $UserTableTable,
                          TransactionTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableTableReferences
                              ._transactionTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTableTable,
      UserTableData,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (UserTableData, $$UserTableTableReferences),
      UserTableData,
      PrefetchHooks Function({bool walletTableRefs, bool transactionTableRefs})
    >;
typedef $$WalletTableTableCreateCompanionBuilder =
    WalletTableCompanion Function({
      Value<int> id,
      required int userId,
      required String balance,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$WalletTableTableUpdateCompanionBuilder =
    WalletTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> balance,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$WalletTableTableReferences
    extends BaseReferences<_$AppDatabase, $WalletTableTable, WalletTableData> {
  $$WalletTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTableTable _userIdTable(_$AppDatabase db) =>
      db.userTable.createAlias(
        $_aliasNameGenerator(db.walletTable.userId, db.userTable.id),
      );

  $$UserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UserTableTableTableManager(
      $_db,
      $_db.userTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WalletTableTableFilterComposer
    extends Composer<_$AppDatabase, $WalletTableTable> {
  $$WalletTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableFilterComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WalletTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WalletTableTable> {
  $$WalletTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableOrderingComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WalletTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WalletTableTable> {
  $$WalletTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WalletTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WalletTableTable,
          WalletTableData,
          $$WalletTableTableFilterComposer,
          $$WalletTableTableOrderingComposer,
          $$WalletTableTableAnnotationComposer,
          $$WalletTableTableCreateCompanionBuilder,
          $$WalletTableTableUpdateCompanionBuilder,
          (WalletTableData, $$WalletTableTableReferences),
          WalletTableData,
          PrefetchHooks Function({bool userId})
        > {
  $$WalletTableTableTableManager(_$AppDatabase db, $WalletTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WalletTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WalletTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WalletTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> balance = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WalletTableCompanion(
                id: id,
                userId: userId,
                balance: balance,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String balance,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WalletTableCompanion.insert(
                id: id,
                userId: userId,
                balance: balance,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WalletTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$WalletTableTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$WalletTableTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WalletTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WalletTableTable,
      WalletTableData,
      $$WalletTableTableFilterComposer,
      $$WalletTableTableOrderingComposer,
      $$WalletTableTableAnnotationComposer,
      $$WalletTableTableCreateCompanionBuilder,
      $$WalletTableTableUpdateCompanionBuilder,
      (WalletTableData, $$WalletTableTableReferences),
      WalletTableData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$TransactionTableTableCreateCompanionBuilder =
    TransactionTableCompanion Function({
      Value<int> id,
      required int userId,
      required int toWalletId,
      required int fromWalletId,
      required String amount,
      Value<DateTime> createdAt,
    });
typedef $$TransactionTableTableUpdateCompanionBuilder =
    TransactionTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> toWalletId,
      Value<int> fromWalletId,
      Value<String> amount,
      Value<DateTime> createdAt,
    });

final class $$TransactionTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionTableTable,
          TransactionTableData
        > {
  $$TransactionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserTableTable _userIdTable(_$AppDatabase db) =>
      db.userTable.createAlias(
        $_aliasNameGenerator(db.transactionTable.userId, db.userTable.id),
      );

  $$UserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UserTableTableTableManager(
      $_db,
      $_db.userTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WalletTableTable _toWalletIdTable(_$AppDatabase db) =>
      db.walletTable.createAlias(
        $_aliasNameGenerator(db.transactionTable.toWalletId, db.walletTable.id),
      );

  $$WalletTableTableProcessedTableManager get toWalletId {
    final $_column = $_itemColumn<int>('to_wallet_id')!;

    final manager = $$WalletTableTableTableManager(
      $_db,
      $_db.walletTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toWalletIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WalletTableTable _fromWalletIdTable(_$AppDatabase db) =>
      db.walletTable.createAlias(
        $_aliasNameGenerator(
          db.transactionTable.fromWalletId,
          db.walletTable.id,
        ),
      );

  $$WalletTableTableProcessedTableManager get fromWalletId {
    final $_column = $_itemColumn<int>('from_wallet_id')!;

    final manager = $$WalletTableTableTableManager(
      $_db,
      $_db.walletTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromWalletIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionTableTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableFilterComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableFilterComposer get toWalletId {
    final $$WalletTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableFilterComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableFilterComposer get fromWalletId {
    final $$WalletTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableFilterComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableOrderingComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableOrderingComposer get toWalletId {
    final $$WalletTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableOrderingComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableOrderingComposer get fromWalletId {
    final $$WalletTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableOrderingComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableAnnotationComposer get toWalletId {
    final $$WalletTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableAnnotationComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WalletTableTableAnnotationComposer get fromWalletId {
    final $$WalletTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromWalletId,
      referencedTable: $db.walletTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WalletTableTableAnnotationComposer(
            $db: $db,
            $table: $db.walletTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionTableTable,
          TransactionTableData,
          $$TransactionTableTableFilterComposer,
          $$TransactionTableTableOrderingComposer,
          $$TransactionTableTableAnnotationComposer,
          $$TransactionTableTableCreateCompanionBuilder,
          $$TransactionTableTableUpdateCompanionBuilder,
          (TransactionTableData, $$TransactionTableTableReferences),
          TransactionTableData,
          PrefetchHooks Function({
            bool userId,
            bool toWalletId,
            bool fromWalletId,
          })
        > {
  $$TransactionTableTableTableManager(
    _$AppDatabase db,
    $TransactionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> toWalletId = const Value.absent(),
                Value<int> fromWalletId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionTableCompanion(
                id: id,
                userId: userId,
                toWalletId: toWalletId,
                fromWalletId: fromWalletId,
                amount: amount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int toWalletId,
                required int fromWalletId,
                required String amount,
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionTableCompanion.insert(
                id: id,
                userId: userId,
                toWalletId: toWalletId,
                fromWalletId: fromWalletId,
                amount: amount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userId = false, toWalletId = false, fromWalletId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$TransactionTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$TransactionTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (toWalletId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.toWalletId,
                                    referencedTable:
                                        $$TransactionTableTableReferences
                                            ._toWalletIdTable(db),
                                    referencedColumn:
                                        $$TransactionTableTableReferences
                                            ._toWalletIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (fromWalletId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.fromWalletId,
                                    referencedTable:
                                        $$TransactionTableTableReferences
                                            ._fromWalletIdTable(db),
                                    referencedColumn:
                                        $$TransactionTableTableReferences
                                            ._fromWalletIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionTableTable,
      TransactionTableData,
      $$TransactionTableTableFilterComposer,
      $$TransactionTableTableOrderingComposer,
      $$TransactionTableTableAnnotationComposer,
      $$TransactionTableTableCreateCompanionBuilder,
      $$TransactionTableTableUpdateCompanionBuilder,
      (TransactionTableData, $$TransactionTableTableReferences),
      TransactionTableData,
      PrefetchHooks Function({bool userId, bool toWalletId, bool fromWalletId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$WalletTableTableTableManager get walletTable =>
      $$WalletTableTableTableManager(_db, _db.walletTable);
  $$TransactionTableTableTableManager get transactionTable =>
      $$TransactionTableTableTableManager(_db, _db.transactionTable);
}
