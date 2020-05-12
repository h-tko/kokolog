import 'package:flutter/material.dart';
import 'package:kokolog/config/colors.dart';
import 'package:kokolog/di/registory.dart';
import 'package:kokolog/ui/home/tab_item/chart.dart';
import 'package:kokolog/ui/home/tab_item/regist.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _tab = <Tab>[
    Tab(
      child: Align(alignment: Alignment.center, child: Icon(Icons.create)),
    ),
    Tab(
      child:
          Align(alignment: Alignment.center, child: Icon(Icons.insert_chart)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          bottom: PreferredSize(
            child: TabBar(
              labelColor: primaryColor,
              unselectedLabelColor: Theme.of(context).scaffoldBackgroundColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              tabs: _tab,
            ),
            preferredSize: Size.fromHeight(20.0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ChangeNotifierProvider(
              create: (_) => ViewModelRegistory.makeRegistViewModel(),
              child: Regist(),
            ),
            ChangeNotifierProvider(
              create: (_) => ViewModelRegistory.makeChartViewModel(),
              child: Chart(),
            ),
          ],
        ),
      ),
    );
  }
}
