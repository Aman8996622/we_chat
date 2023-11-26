import 'dart:async';

import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer.periodic(Duration(
    //   milliseconds:  2000
    // ), (timer) {
        

    //  })
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              color: Colors.red,
              width: 20,

            )
          ],
        ),
      ),
    );
  }
}
