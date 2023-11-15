import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthStream {
  AuthStream._();
  static final AuthStream _singleTon = AuthStream._();

  final StreamController<PhoneAuthCredential> authStreamController =
      StreamController.broadcast();

  factory AuthStream() {
    return _singleTon;
  }

  get stream  => authStreamController.stream;



  void listen({
   required   Function callback
  })
  {
     
  }




}
