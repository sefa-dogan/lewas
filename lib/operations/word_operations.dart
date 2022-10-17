// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'dart:math';

class WordOperations {
  final Map<String, dynamic> _kelimeler;

  WordOperations(this._kelimeler);

  // ignore: non_constant_identifier_names
  List ReturnRandomWord() {
    int sayi = Random().nextInt(_kelimeler.length);
    List<String> _keys = _kelimeler.keys.toList();
    // ignore: no_leading_underscores_for_local_identifiers
    List _values = _kelimeler.values.toList();

    return [_keys[sayi], _values[sayi]];
  }
}
