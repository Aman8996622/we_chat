import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:we_chat/core/enums/enums.dart';
import 'package:we_chat/core/routes/routes.dart';
import 'package:we_chat/data/shared_preferences/index.dart';

class RegisterController with ChangeNotifier {
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController phoneText = TextEditingController();

  void initiState() {}

  Future<void> registerButtonClicked({
    required BuildContext context,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    try {
      var result = await firebaseFirestore
          .collection("user")
          .where("phone", isEqualTo: phoneText.text);

      if (await result.snapshots().isEmpty) {
        await firebaseFirestore.collection("user").add({
          "name": userName.text,
          "password": password.text,
          "phone": phoneText.text,
        });
        var sharedPreference = GetIt.I<PreferenceHepler>();
        await sharedPreference.saveAuthStatus(authStatus: AuthStatus.login);

        context.pushNamed(AppNameRoutes.addProfile);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Given user is already register with"),
            ),
          );
        }
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
