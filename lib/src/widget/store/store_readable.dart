// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../widget.dart';
import 'store.dart';

/// Reactive store available for reading.
class ReadableStore {
  final Map<String, ProxyStore> _store = {};

  /// Creates a store of readable proxies created on [Map].
  ReadableStore(Map<String, dynamic> fields) {
    fields.forEach((key, value) => _store[key] = ProxyStore(value));
  }

  /// Takes [Widget] second argument as a store dependency.
  dynamic get(String key, Widget widget) {
    return _store[key]?.get(widget.node);
  }

  /// [ReadableStore] proxy can be destroyed,
  /// takes the key of the value to be destroyed.
  void destroy(String key) {
    _store[key]?.destroy();
  }

  /// Clears proxy dependencies and proxies from the store.
  void clear() {
    _store.forEach((key, value) => destroy(key));
    _store.clear();
  }
}
