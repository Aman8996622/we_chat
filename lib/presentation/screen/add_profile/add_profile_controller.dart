import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:we_chat/core/enums/enums.dart';
import 'package:we_chat/core/file_manager/file_manager.dart';
import 'package:we_chat/core/string_extension/string_extension.dart';
import 'package:we_chat/data/shared_preferences/index.dart';
import 'package:we_chat/models/user.dart';

class AddProfileController with ChangeNotifier {
  ImagePicker? imagePicker = ImagePicker();
  TextEditingController firstNameController =
      TextEditingController(text: "Aman");
  TextEditingController lastNameController =
      TextEditingController(text: "sharma");

  TextEditingController passwordText = TextEditingController(text: "A123456");

  TextEditingController phoneNameController =
      TextEditingController(text: "6377740090");

  XFile? xProfileImage;

  String? profileImage;

  void intiState() {}

  Future<void> addProfileButtonClicked({
    required BuildContext context,
  }) async {
    XFile? xfile = await imagePicker?.pickImage(source: ImageSource.gallery);

    xProfileImage = xfile;

    if (xfile != null) {
      profileImage = await FileManager.writeUserSignature(
        image: await xfile.readAsBytes(),
        uniqueKey: phoneNameController.text,
      );
    }

    notifyListeners();
  }

  Future<void> registerButtonClicked({
    required BuildContext context,
  }) async {
    var sharedPreference = GetIt.I<PreferenceHepler>();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    var reference =
        firebaseStorage.ref().child("user_profile/${profileImage?.fileName}");

    String imagePath =
        FileManager.userSignaturePath(uniqueKey: phoneNameController.text);

    var uploadTask = reference.putFile(File(imagePath));

    var downloadUrl = await (await uploadTask).ref.getDownloadURL();

    var user = User(
      isOnline: 0,
      password: passwordText.text,
      phoneNumber: phoneNameController.text,
      userName: '${firstNameController.text} ${lastNameController.text}',
      profileImage: downloadUrl,
    );

    // await firebaseFirestore
    //     .collection("user")
    //     .doc(phoneNameController.text).add.add(user.toJson());

    await firebaseFirestore
        .collection("user")
        .doc(phoneNameController.text)
        .set(
          user.toJson(),
        );

    sharedPreference.saveAuthStatus(authStatus: AuthStatus.login);
  }
}
