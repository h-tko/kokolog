import 'package:flutter/material.dart';

class RecordModel {
  int id;
  int year;
  int month;
  int day;
  int kokoro;
  String reason;

  RecordModel(
      {this.id,
      @required this.year,
      @required this.month,
      @required this.day,
      @required this.kokoro,
      @required this.reason});

  Map<String, dynamic> toMap() {
    return {
      "year": this.year,
      "month": this.month,
      "day": this.day,
      "kokoro": this.kokoro,
      "reason": this.reason,
    };
  }

  static RecordModel fromMap(Map<String, dynamic> map) {
    if (map.length < 1) {
      return null;
    }

    return RecordModel(
      id: map["id"],
      year: map["year"],
      month: map["month"],
      day: map["day"],
      kokoro: map["kokoro"],
      reason: map["reason"],
    );
  }
}
