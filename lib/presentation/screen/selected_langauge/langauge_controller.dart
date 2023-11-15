import 'package:flutter/material.dart';

class LangaugeController with ChangeNotifier {
  Locale? locale = Locale("en");

  String selectValue = "English";

  void changeLocale(String? languagesName) {
    if (languagesName == "English") {
      selectValue = "English";
      locale = Locale("en", "en");
    } else {
      if (languagesName == "Hindi") {
        locale = const Locale(
          "hi",
        );
        selectValue = "Hindi";
      }
    }

    notifyListeners();
  }
}
