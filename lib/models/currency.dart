class Option {
  String name;
  dynamic value;
  Option({
    required this.name,
    required this.value,
  });
}

class Currency {
  List<Option>? options;
  String code;
  bool isApplePayAvailable;
  bool hasSEPA;

  Currency({
    required this.code,
    this.isApplePayAvailable = true,
    this.hasSEPA = false,
    this.options,
  });
}
