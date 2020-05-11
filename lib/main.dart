import 'package:flutter/material.dart';
import 'package:kokolog/config/colors.dart';
import 'package:kokolog/di/registory.dart';
import 'package:provider/provider.dart';
import 'ui/home/home.dart';

void main() => runApp(KokologApp());

class KokologApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ViewModelRegistory.makeRegistViewModel(),
        child: Home(),
      ),
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
