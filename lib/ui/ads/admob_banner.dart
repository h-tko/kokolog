//import 'package:firebase_admob/firebase_admob.dart';
//import 'package:flutter/material.dart';
//import 'package:kokolog/config/app_config.dart';
//
//class AdmobBanner {
//  static BannerAd build(BuildContext context) {
//    return BannerAd(
//        adUnitId: _adUnitId,
//        size: AdSize.smartBanner,
//        listener: (MobileAdEvent event) {
//          debugPrint("admob 読み込み完了");
//        });
//  }
//
//  static String get _adUnitId =>
//      AppConfig().isDebug ? BannerAd.testAdUnitId : "";
//}
//
