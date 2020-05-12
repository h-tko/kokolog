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
    var result;
    Kokoro.values.forEach((element) {
      if (element.value == value) {
        result = element;
      }
    });

    if (result == null) {
      throw new Exception("想定の範囲外の値が渡されました。");
    }

    return result;
  }

  static Kokoro fromNum(num value) {
    return fromDouble(value.toDouble());
  }
}
