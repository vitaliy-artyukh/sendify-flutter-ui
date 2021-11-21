import 'dart:convert';

import 'package:flutter/foundation.dart';

class CultureCfg {
  String? name;
  String? code;
  String? cultureCode;
  List<String>? phoneNumberMaskStr;
  List<String>? phoneNumberExamples;
  String? ibanMaskStr;
  String? postalCodeMaskStr;
  CultureCfg({
    this.name,
    this.code,
    this.cultureCode,
    this.phoneNumberMaskStr,
    this.phoneNumberExamples,
    this.ibanMaskStr,
    this.postalCodeMaskStr,
  });

  CultureCfg copyWith({
    String? name,
    String? code,
    String? cultureCode,
    List<String>? phoneNumberMaskStr,
    List<String>? phoneNumberExamples,
    String? ibanMaskStr,
    String? postalCodeMaskStr,
  }) {
    return CultureCfg(
      name: name ?? this.name,
      code: code ?? this.code,
      cultureCode: cultureCode ?? this.cultureCode,
      phoneNumberMaskStr: phoneNumberMaskStr ?? this.phoneNumberMaskStr,
      phoneNumberExamples: phoneNumberExamples ?? this.phoneNumberExamples,
      ibanMaskStr: ibanMaskStr ?? this.ibanMaskStr,
      postalCodeMaskStr: postalCodeMaskStr ?? this.postalCodeMaskStr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'cultureCode': cultureCode,
      'phoneNumberMaskStr': phoneNumberMaskStr,
      'phoneNumberExamples': phoneNumberExamples,
      'ibanMaskStr': ibanMaskStr,
      'postalCodeMaskStr': postalCodeMaskStr,
    };
  }

  factory CultureCfg.fromMap(Map<String, dynamic> map) {
    return CultureCfg(
      name: map['name'],
      code: map['code'],
      cultureCode: map['cultureCode'],
      phoneNumberMaskStr: List<String>.from(map['phoneNumberMaskStr']),
      phoneNumberExamples: List<String>.from(map['phoneNumberExamples']),
      ibanMaskStr: map['ibanMaskStr'],
      postalCodeMaskStr: map['postalCodeMaskStr'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory CultureCfg.fromJson(String source) =>
      CultureCfg.fromMap(jsonDecode(source));

  static String toJsonList(List<CultureCfg> source) {
    return jsonEncode(source);
  }

  @override
  String toString() {
    return 'CultureCfg(name: $name, code: $code, cultureCode: $cultureCode, phoneNumberMaskStr: $phoneNumberMaskStr, phoneNumberExamples: $phoneNumberExamples, ibanMaskStr: $ibanMaskStr, postalCodeMaskStr: $postalCodeMaskStr)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CultureCfg &&
        other.name == name &&
        other.code == code &&
        other.cultureCode == cultureCode &&
        listEquals(other.phoneNumberMaskStr, phoneNumberMaskStr) &&
        listEquals(other.phoneNumberExamples, phoneNumberExamples) &&
        other.ibanMaskStr == ibanMaskStr &&
        other.postalCodeMaskStr == postalCodeMaskStr;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        code.hashCode ^
        cultureCode.hashCode ^
        phoneNumberMaskStr.hashCode ^
        phoneNumberExamples.hashCode ^
        ibanMaskStr.hashCode ^
        postalCodeMaskStr.hashCode;
  }
}
