import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:kokolog/config/app_config.dart';
import 'package:kokolog/config/colors.dart';
import 'package:kokolog/ui/home/home.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(KokologApp());

class KokologApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Crashlytics.instance.enableInDevMode = AppConfig().isDebug;

    if (!AppConfig().isDebug) {
      FlutterError.onError = Crashlytics.instance.recordFlutterError;
    }

    initializeDateFormatting();

    return MaterialApp(
      home: Home(),
      title: 'ココログ',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primaryColor,
      ),
    );
  }
}
