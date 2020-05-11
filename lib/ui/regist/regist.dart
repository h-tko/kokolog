import 'package:flutter/material.dart';
import 'package:kokolog/config/colors.dart';
import 'package:kokolog/model/kokoro_enum.dart';
import 'package:kokolog/view_model/regist_view_model.dart';
import 'package:kokolog/ui/components/base_text.dart';
import 'package:provider/provider.dart';

class Regist extends StatelessWidget {
  var _kokoro = 0.0;

  @override
  Widget build(BuildContext context) {
    _kokoro =
        Provider.of<RegistViewModel>(context).getKokoro().value.toDouble();

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
      child: Padding(
        padding: EdgeInsets.only(right: 50.0, left: 50.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
              child: Center(
                child: BaseText(
                  text: '今日1日はどうでしたか？',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Slider(
                value: _kokoro,
                min: 0,
                max: 4,
                divisions: 4,
                label: KokoroExt.fromDouble(_kokoro).description,
                onChanged: (double value) {
                  Provider.of<RegistViewModel>(context, listen: false)
                      .setKokoro(KokoroExt.fromDouble(value));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Theme(
                  data: ThemeData(
                    primaryColor: textFormPrimaryColor,
                    primaryColorDark: textFormPrimaryColor,
                  ),
                  child: TextField(
                    onSubmitted: Provider.of<RegistViewModel>(
                      context,
                      listen: false,
                    ).setComment,
                    maxLength: 50,
                    decoration: InputDecoration(
                      fillColor: textFormPrimaryColor,
                      hintText: "それはなぜですか？（50文字以内）",
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
      ),
    );
  }
}
