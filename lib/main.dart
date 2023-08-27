import 'package:easy_localization/easy_localization.dart';
import 'package:fbclub/basic/routes.dart';
import 'package:fbclub/basic/theme.dart';
import 'package:fbclub/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); // 언어 localization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Firebase

  runApp(
      EasyLocalization(
        saveLocale: true,
        useOnlyLangCode: true,
        // 언어는 본인이 필요한 거에 맞게 작성(추후에 만들 json파일과 관련이 있음)
        supportedLocales: const [Locale('en'), Locale('ko')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      )
  );
  // runApp(

      // MultiBlocProvider(
      //   providers: [
      //     BlocProvider<BlocA>(
      //       create: (BuildContext context) => BlocA(),
      //     ),
      //     BlocProvider<BlocB>(
      //       create: (BuildContext context) => BlocB(),
      //     ),
      //     BlocProvider<BlocC>(
      //       create: (BuildContext context) => BlocC(),
      //     ),
      //   ],
      //   child: const MyApp(),
      // )

  // );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 정방향만 사용할 수 있다.
      // DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);

    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Football Club',
        initialRoute: SplashScreen.routeName,
        routes: routes,
        theme: theme(),
      ),
    );
  }
}
