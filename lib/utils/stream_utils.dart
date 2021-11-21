import 'dart:async';

extension StreamExtensions on StreamSubscription {
  void disposeWith(List<StreamSubscription?> collection) {
    collection.add(this);
  }
}

extension StreamExtensionsExt on List<StreamSubscription?> {
  void dispose() {
    for (var item in this) {
      item?.cancel();
    }
  }
}
