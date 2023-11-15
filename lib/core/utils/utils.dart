import 'dart:convert';
import 'dart:io';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static var _Uuid = Uuid();

  /// provides hazard icons and keep them in
  ///  the memory all the time while app is alive
  static List<String> hazardIcons = List.empty(growable: true);

  static Widget divider({
    Color? color,
    double height = 1,
    double thickness = 2,
  }) {
    return Divider(
      thickness: thickness,
      height: height,
      color: color ?? Colors.white,
    );
  }

  static double responsiveWidth({
    required BuildContext context,
    required dynamic width,
  }) {
    var totalWidth = MediaQuery.of(context).size.width;
    var calculatedWidth = (width / 100) * totalWidth;
    return calculatedWidth;
  }

  static double responsiveHeight({
    required BuildContext context,
    required dynamic height,
  }) {
    var totalHeight = MediaQuery.of(context).size.height;
    var calculatedHeight = (height / 100) * totalHeight;
    return calculatedHeight;
  }

  static double responsiveHeightConstraints({
    required BoxConstraints constraints,
    required dynamic height,
  }) {
    var totalHeight = constraints.minHeight;
    var calculatedHeight = (height / 100) * totalHeight;
    return calculatedHeight;
  }

  static double responsiveWidthConstraints({
    required BoxConstraints constraints,
    required dynamic width,
  }) {
    var totalWidth = constraints.maxWidth;
    var calculatedWidth = (width / 100) * totalWidth;
    return calculatedWidth;
  }

  static double responsiveFontSize({
    required double fontSize,
    required BuildContext context,
  }) {
    double sp = fontSize * (MediaQuery.of(context).size.width / 3) / 100;
    return sp;
  }

  static void showAlert({
    required String title,
    required String message,
    List<String>? buttonTitles,
    String? cancelButtonTitle,
    required BuildContext context,
    Function? buttonTapped,
    Function? cancelButtonTapped,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) {
        List<Widget> list = List.empty(growable: true);
        list.add(
          CupertinoButton(
            child: Text(cancelButtonTitle ?? "Cancel"),
            onPressed: () {
              if (cancelButtonTapped != null) {
                cancelButtonTapped(dialogContext);
              }
              Navigator.pop(dialogContext);
            },
          ),
        );
        for (var title in buttonTitles ?? []) {
          list.add(
            CupertinoButton(
              child: Text(title),
              onPressed: () {
                if (buttonTapped != null) {
                  buttonTapped(buttonTitles?.indexOf(title), dialogContext);
                }
                Navigator.pop(dialogContext);
              },
            ),
          );
        }

        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: list,
        );
      },
    );
  }

  static String uuid() {
    String key = Utils._Uuid.v4();

    if (Platform.isIOS == true) {
      key = "iOS_" + key;
    } else {
      key = "Android_" + key;
    }
    return key;
  }

  // static openUrl(String url) {
  //   Uri uri = Uri.parse(url);

  //   if(!await launchUrl())

  // }

  static void readHazardIcons({required BuildContext context}) async {
    hazardIcons.clear();
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final images = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets/hazard_icons'));
    for (var image in images) {
      hazardIcons.add(image);
    }
  }

  /* ************** */
// JSON STRING
  /// converts provided [map] into json string
/* ************** */
  static String jsonString(Map map) {
    String str = json.encode(map);
    return str;
  }

  static FlCountryCodePicker countryCodePicker() {
    var value = const FlCountryCodePicker(
      localize: true,
      showDialCode: true,
      showSearchBar: true,
       
    );

    return value;
  }
}
