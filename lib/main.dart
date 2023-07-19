import 'package:fbclub/basic/routes.dart';
import 'package:fbclub/basic/splash_screen.dart';
import 'package:fbclub/basic/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Club',
      initialRoute: SplashScreen.routeName,
      routes: routes,
      theme: theme(),
    );
  }
}
