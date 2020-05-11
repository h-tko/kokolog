import 'package:flutter/material.dart';
import 'package:kokolog/model/kokoro_enum.dart';
import 'package:kokolog/repository/record_repository.dart';

class RegistViewModel extends ChangeNotifier {
  Kokoro _kokoro = Kokoro.normal;
  String _comment = "";

  final RecordRepository repo;

  RegistViewModel(this.repo);

  String getComment() => _comment;

  setComment(String comment) {
    this._comment = comment;
  }

  Kokoro getKokoro() => _kokoro;

  setKokoro(Kokoro kokoro) {
    this._kokoro = kokoro;

    notifyListeners();
  }

  registData() {}
}
