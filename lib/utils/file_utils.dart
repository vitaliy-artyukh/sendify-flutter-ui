import 'dart:convert';

import 'package:flutter/services.dart';

extension JsonListParse on String {
  List<T> fromJsonArray<T>(
      T Function(Map<String, dynamic> item) factoryCreator) {
    List<T> res = List.empty(growable: true);
    Iterable l = json.decode(this);
    for (var item in l) {
      res.add(factoryCreator(item));
    }
    return res;
  }
}

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}
