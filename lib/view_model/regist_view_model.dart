import 'package:flutter/material.dart';
import 'package:kokolog/model/kokoro_enum.dart';
import 'package:kokolog/model/record_model.dart';
import 'package:kokolog/repository/record_repository.dart';

class RegistViewModel extends ChangeNotifier {
  var _kokoro = Kokoro.normal;
  var _reason = "";
  var _errors = <String, String>{};

  final RecordRepository repo;

  RegistViewModel(this.repo);

  String getComment() => _reason;

  String errorsToString() {
    var result = "";
    _errors.forEach((key, value) {
      if (result.isNotEmpty) {
        result += "\n";
      }

      result += value;
    });

    return result;
  }

  setComment(String reason) {
    this._reason = reason;
  }

  Kokoro getKokoro() => _kokoro;

  setKokoro(Kokoro kokoro) {
    this._kokoro = kokoro;

    notifyListeners();
  }

  Future<bool> onPressedRegist() async {
    // バリデエラー
    if (!_validate()) {
      return false;
    }

    // 現在日付の取得
    final now = DateTime.now();

    await repo.save(RecordModel(
      kokoro: _kokoro.value,
      reason: _reason,
      year: now.year,
      month: now.month,
      day: now.day,
    ));

    return true;
  }

  bool _validate() {
    if (this._reason.isEmpty) {
      _errors["reason"] = "理由を入力してください。";
      return false;
    }

    return true;
  }
}
