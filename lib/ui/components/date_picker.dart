import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DatePickerDelegate {
  onSelected(DateTime newDateTime) {}
}

class DatePicker {
  final DatePickerDelegate delegate;
  DateTime current;

  DatePicker({@required this.delegate, this.current}) {
    if (this.current == null) {
      this.current = DateTime.now();
    }
  }

  show(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('キャンセル'),
                      onPressed: () => Navigator.pop(context),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                    ),
                    CupertinoButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                        delegate.onSelected(current);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              _buildPickerWidget(
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: DateTime.now(),
                  minimumDate: DateTime.now().add(Duration(days: -7)),
                  initialDateTime: current,
                  onDateTimeChanged: (DateTime newDateTime) =>
                      current = newDateTime,
                ),
              ),
            ],
          );
        });
  }

  Widget _buildPickerWidget(Widget picker) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
