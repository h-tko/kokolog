import 'package:flutter/material.dart';

enum Kokoro {
  bad,
  notSoGood,
  normal,
  good,
  veryGood,
}

class RegistModel extends ChangeNotifier {
  Kokoro _kokoro = Kokoro.normal;
  String _comment = "";

  String getComment() => _comment;

  setComment(String comment) {
    this._comment = comment;

    notifyListeners();
  }
}
