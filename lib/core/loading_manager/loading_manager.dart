import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingManager {
  LoadingManager._();
  static final LoadingManager _singleton = LoadingManager._();
  factory LoadingManager() => _singleton;

  /* *************************************h* */
  // INITIALISE LOADING
  /* ************************************** */
  void init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.red
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  /* ************************************** */
  // SHOW LOADING
  /* ************************************** */
  static void showLoading({String? message}) {
    EasyLoading.show(status: message ?? "Please wait...", dismissOnTap: false);
  }

  /* ************************************** */
  // HIDE LOADING
  /* ************************************** */
  static void dismiss() {
    EasyLoading.dismiss();
  }
}
