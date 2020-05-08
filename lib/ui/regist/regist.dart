import 'package:flutter/material.dart';
import 'package:kokolog/config/colors.dart';
import 'package:kokolog/model/regist_model.dart';
import 'package:kokolog/ui/components/base_text.dart';
import 'package:provider/provider.dart';

class Regist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ココログ')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                _buildInputs(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputs(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Center(
              child: BaseText(
//                text: '今日1日はどうでしたか？',
                text: Provider.of<RegistModel>(context).getComment(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Theme(
                data: ThemeData(
                  primaryColor: textFormPrimaryColor,
                  primaryColorDark: textFormPrimaryColor,
                ),
                child: TextField(
                  onSubmitted: Provider.of<RegistModel>(
                    context,
                    listen: false,
                  ).setComment,
                  decoration: InputDecoration(
                    fillColor: textFormPrimaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
