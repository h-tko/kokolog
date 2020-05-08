import 'package:flutter/material.dart';

enum Kokoro {
  bad,
  notSoGood,
  normal,
  good,
  veryGood,
}

extension KokoroExt on Kokoro {
  String get description {
    switch (this) {
      case Kokoro.bad:
        return "悪い";
      case Kokoro.notSoGood:
        return "いまいち";
      case Kokoro.normal:
        return "普通";
      case Kokoro.good:
        return "良い";
      case Kokoro.veryGood:
        return "最高！";
      default:
        return "";
    }
  }

  int get value {
    switch (this) {
      case Kokoro.bad:
        return 0;
      case Kokoro.notSoGood:
        return 1;
      case Kokoro.normal:
        return 2;
      case Kokoro.good:
        return 3;
      case Kokoro.veryGood:
        return 4;
      default:
        return 0;
    }
  }

  static Kokoro fromDouble(double value) {
    return Kokoro.values
        .firstWhere((element) => element.value == value.toInt());
  }
}

class RegistModel extends ChangeNotifier {
  Kokoro _kokoro = Kokoro.normal;
  String _comment = "";

  String getComment() => _comment;

  setComment(String comment) {
    this._comment = comment;
  }

  Kokoro getKokoro() => _kokoro;

  setKokoro(Kokoro kokoro) {
    this._kokoro = kokoro;

    notifyListeners();
  }
}
