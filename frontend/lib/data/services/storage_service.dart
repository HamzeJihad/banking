import 'dart:convert';

import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Service()
class StorageService {
  final DSON _dson;
  StorageService(this._dson);
  AsyncResult<T> saveData<T extends Object>(T value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = _dson.toJson<T>(value);
      await prefs.setString(T.toString(), jsonEncode(json));
      return Success(value);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<T> getData<T extends Object>() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(T.toString());
    if (json == null) {
      return Failure(Exception('No data found for type $T'));
    }
    try {
      final map = jsonDecode(json);
      final value = _dson.fromJson<T>(map);
      return Success(value);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Unit> delete<T extends Object>() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(T.toString());
    return Success(unit);
  }
}
