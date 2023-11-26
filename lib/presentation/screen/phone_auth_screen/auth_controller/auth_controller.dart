import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:we_chat/core/routes/routes.dart';
import 'package:we_chat/core/utils/utils.dart';
import 'package:we_chat/data/model/phone_verification.dart';

class AuthController with ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  String? errorMessage;

  String? countryPhoneCode;

  CountryCode? selectCountryCode;

  String? flagImage;

  PhoneVerification? phoneVerification;

  String? reSendToken;
  String? verificationId;

  void initisalized() async {
    var countryCodeList = const FlCountryCodePicker()
        .countryCodes
        .where((element) => element.dialCode == "+91");

    selectCountryCode = countryCodeList.first;
    notifyListeners();
  }

  void openThePhoneCodeDirectory() {
    var value = Utils.countryCodePicker();
    notifyListeners();
  }

  Future<void> countryCodeTextClicked({
    required BuildContext context,
  }) async {
    selectCountryCode =
        await const FlCountryCodePicker().showPicker(context: context);

    notifyListeners();
  }

  /* ********************/
  //
  /* ********************/
  Future<void> contiuneButtonClicked({
    required BuildContext context,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance; 
  
     
  }

  void signUpButtonClicked({
    required BuildContext context,
  }) {
    GoRouter.of(context).pushNamed(AppNameRoutes.addProfile);
  }
}
