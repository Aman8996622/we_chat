import 'package:flutter_contacts/flutter_contacts.dart';

class ContactHelper {
  static Future<void> 
  getFlutterContactList() async {
    var permission = await FlutterContacts.requestPermission();

    if (permission == true) {
      var contactsList = await FlutterContacts.getContacts();

      print(contactsList);
    }
  }
}
