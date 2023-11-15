// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQ91PI9LPEC-rO_3pxWuHJcii424J5OGY',
    appId: '1:781817843865:web:46a2aacf838de3c2c56808',
    messagingSenderId: '781817843865',
    projectId: 'safety-apps-33f5b',
    authDomain: 'safety-apps-33f5b.firebaseapp.com',
    storageBucket: 'safety-apps-33f5b.appspot.com',
    measurementId: 'G-EB67PH080G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmT4y8rXO7u9xYAq6JEd1b3SlWHy3GmxY',
    appId: ':977002907115:android:1452d834de869a5dce05ae',
    messagingSenderId: '977002907115',
    projectId: 'wechat-c1983',
    storageBucket: 'wechat-c1983.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmT4y8rXO7u9xYAq6JEd1b3SlWHy3GmxY',
    appId: '1:781817843865:ios:4be7ed07192adf1ac56808',
    messagingSenderId: '781817843865',
    projectId: 'safety-apps-33f5b',
    storageBucket: 'safety-apps-33f5b.appspot.com',
    iosClientId:
        '781817843865-tt2ceba85dinn73qmnoahruq3bb16gv9.apps.googleusercontent.com',
    iosBundleId: 'com.riskassessorlite.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlwm9XdUi4qdP0ExAjgUJFE7-JpgyFRSQ',
    appId: '1:781817843865:ios:427d9dc6f86b4d38c56808',
    messagingSenderId: '781817843865',
    projectId: 'safety-apps-33f5b',
    storageBucket: 'safety-apps-33f5b.appspot.com',
    iosClientId:
        '781817843865-opt08fmo1qd7q4p73nnt8earpd6po4k7.apps.googleusercontent.com',
    iosBundleId: 'com.example.cleanArch',
  );
}