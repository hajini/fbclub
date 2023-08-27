import 'dart:async';
import 'package:fbclub/DataModel/user_coredata.dart';
import 'package:fbclub/main_screen.dart';
import 'package:flutter/material.dart';
import 'Login/login_screen.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
      Future<bool> cc = UserCoreData().getUserCoreDataFromLocal();
      cc.then((result) {
        if (result) {
          // 로그인 정보가 device 에 있을 경우
          // if 해당 device 가 서버 등록된 device 와 일치할 경우
          print("move to main page");
          _completeSplash(context, MainScreen());

        } else {
          // 로그인 정보가 device 에 없을 경우
          // device가 일치하지 않을 경우
          // 로그인 페이지로 이동
          print("move to login page");
          _completeSplash(context, LoginScreen());
        }
      });

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
                child: Image(image: const AssetImage('assets/images/football_club.png'),
                    width: MediaQuery.of(context).size.width/3,
                    height: ((MediaQuery.of(context).size.width/3) * 1.5),
                    alignment: Alignment.center)
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
