import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sendify/models/culture_cfg.dart';
import 'package:sendify/models/currency.dart';
import 'package:sendify/utils/file_utils.dart';

class Resources {
  static Resources instance = Resources();

  List<CultureCfg>? culturesInfo;
  Map<String, CultureCfg>? culturesInfoMap;

  late List<Currency> currencies;

  void load() {
    currencies = [
      Currency(code: "USD"),
      Currency(code: "AUD"),
      Currency(code: "CAD"),
      Currency(code: "CHF", hasSEPA: true),
      Currency(code: "CNH"),
      Currency(code: "CZK", hasSEPA: true),
      Currency(code: "DKK", hasSEPA: true),
      Currency(code: "EUR", hasSEPA: true),
      Currency(code: "GBP", hasSEPA: true),
      Currency(code: "HKD"),
      Currency(code: "HUF", hasSEPA: true),
      Currency(code: "ILS"),
      Currency(code: "JPY"),
      Currency(code: "MXN"),
      Currency(code: "NOK", hasSEPA: true),
      Currency(code: "NZD"),
      Currency(code: "PLN", hasSEPA: true),
      Currency(code: "RUB"),
      Currency(code: "SEK", hasSEPA: true),
      Currency(code: "SGD"),
      Currency(code: "TRY"),
      Currency(code: "ZAR"),
      Currency(code: "KRW")
    ];
    _loadResources();
    _loadDefaultTranslations();
  }

  void _loadResources() {
    getFileData('assets/json_configs/culture_cfg_mobile.json')
        .asStream()
        .listen((event) {
      Resources.instance.culturesInfo =
          event.fromJsonArray((item) => CultureCfg.fromMap(item));
      Resources.instance.culturesInfoMap = {
        for (var e in Resources.instance.culturesInfo!) e.cultureCode!: e
      };
    });
  }

  void _loadDefaultTranslations() {
    FieldBlocBuilder.defaultErrorBuilder =
        (BuildContext context, String? error, FieldBloc fieldBloc) {
      switch (error) {
        case FieldBlocValidatorsErrors.required:
          if (fieldBloc is MultiSelectFieldBloc ||
              fieldBloc is SelectFieldBloc) {
            return tr('Please select an option');
          }
          return tr('This field is required.');
        case FieldBlocValidatorsErrors.email:
          return tr('The email address is badly formatted.');
        case FieldBlocValidatorsErrors.passwordMin6Chars:
          return tr('The password must contain at least 6 characters.');
        case FieldBlocValidatorsErrors.confirmPassword:
          return tr('Must be equal to password.');
        default:
          return error;
      }
    };
  }
}
