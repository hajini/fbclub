import 'dart:async';
import 'package:fbclub/init_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
      _completeSplash(context, InitScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
                alignment: Alignment.center,
                child: Image(image: const AssetImage('assets/images/first.png'),
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.width * 1.5),
                    alignment: Alignment.center)
            ),
          ],
        ),
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
