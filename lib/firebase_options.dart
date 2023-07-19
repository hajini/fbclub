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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC7mzW31W5BIiXrFn1XZdQnwmdEsNj-D9Y',
    appId: '1:750850235110:web:22ea8776751f9ef3f3f927',
    messagingSenderId: '750850235110',
    projectId: 'fbclub-f488f',
    authDomain: 'fbclub-f488f.firebaseapp.com',
    storageBucket: 'fbclub-f488f.appspot.com',
    measurementId: 'G-ZC8F39HNQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnvwS2_MSIcD06VoswzoPwaQG8frog0Yg',
    appId: '1:750850235110:android:8831b0de604f2fcaf3f927',
    messagingSenderId: '750850235110',
    projectId: 'fbclub-f488f',
    storageBucket: 'fbclub-f488f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzFoVDPAVLpVW-E1IJru8Ry5S96Aee8Gg',
    appId: '1:750850235110:ios:71fc61455a6e10c4f3f927',
    messagingSenderId: '750850235110',
    projectId: 'fbclub-f488f',
    storageBucket: 'fbclub-f488f.appspot.com',
    iosClientId: '750850235110-np64dcmoep36tc0c149kon4d32f5sv19.apps.googleusercontent.com',
    iosBundleId: 'com.fleaplay.fbclub',
  );
}
