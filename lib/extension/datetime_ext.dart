import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formattedString({String format: "yyyy/MM/dd"}) {
    var formatter = DateFormat(format, "ja_JP");
    return formatter.format(this);
  }
}
