

import 'package:decimal/decimal.dart';
import 'package:vaden/vaden.dart';

class DecimalParse extends ParamParse<Decimal, String> {
  @override
  Decimal fromJson(String json) {
    return Decimal.parse(json);
  }

  @override
  String toJson(Decimal param) {
    return param.toString();
  }
}