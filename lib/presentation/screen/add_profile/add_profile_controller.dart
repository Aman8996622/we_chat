import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileController with ChangeNotifier {
  ImagePicker? imagePicker = ImagePicker();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void intiState() {}

  Future<void> addProfileButtonClicked({
    required BuildContext context,
  }) async {
    XFile? xfile = await imagePicker?.pickImage(source: ImageSource.gallery);
    

    
 
  }
}
