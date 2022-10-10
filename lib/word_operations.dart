import 'dart:math';

class WordOperations {
  Map<String, dynamic> _kelimeler;

  WordOperations(this._kelimeler);

  List ReturnRandomWord() {
    int sayi = Random().nextInt(_kelimeler.length);
    List<String> _keys = _kelimeler.keys.toList();
    List _values = _kelimeler.values.toList();

    return [_keys[sayi], _values[sayi]];
  }
}
