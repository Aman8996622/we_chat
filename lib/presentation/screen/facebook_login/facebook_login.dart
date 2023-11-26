import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbLogin extends StatefulWidget {
  const FbLogin({super.key});

  @override
  State<FbLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FbLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await login();
            },
            child: Container(
              height: 30,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("Facebook Login"),
            ),
          )
        ],
      ),
    );
  }

  Future<void> login() async {
    var facebook = FacebookAuth.instance;

    try {
      var result = await facebook.login(
        loginBehavior: LoginBehavior.nativeOnly,
        permissions: [
          'public_profile',
          'email',
          'pages_show_list',
          'pages_messaging',
          'pages_manage_metadata'
        ],
      );

      if (result.status == LoginStatus.success) {
        print("User have cancel the facebook authenication");
      } else if (result.status == LoginStatus.cancelled) {
        print("User have cancel the facebook authenication");
      }
    } catch (e) {
      print(e.toString());
    }

    // try {
    //

    // } catch (e) {
    //   print(e);
    // }
    // facebook.expressLogin();
  }
}
