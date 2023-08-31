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
    apiKey: 'AIzaSyC9WVJCGjFNlDviyo5v5LLccRjUphEa40c',
    appId: '1:896487683242:web:2e84a5ab76fc0973be8cd3',
    messagingSenderId: '896487683242',
    projectId: 'pokedex-flutter-91ccb',
    authDomain: 'pokedex-flutter-91ccb.firebaseapp.com',
    storageBucket: 'pokedex-flutter-91ccb.appspot.com',
    measurementId: 'G-43CQDQ93F4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQzQ1pjFfvwxRX5AxQPEwenUQmPDq6lX4',
    appId: '1:896487683242:android:c318007fd8beb5dfbe8cd3',
    messagingSenderId: '896487683242',
    projectId: 'pokedex-flutter-91ccb',
    storageBucket: 'pokedex-flutter-91ccb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAurJai4mdK7uQyjdpEXaQ-QpCZNM7resQ',
    appId: '1:896487683242:ios:668537f44e9819d4be8cd3',
    messagingSenderId: '896487683242',
    projectId: 'pokedex-flutter-91ccb',
    storageBucket: 'pokedex-flutter-91ccb.appspot.com',
    iosClientId: '896487683242-osu7moctbu91k89s6s1fs8eia0dm6kfv.apps.googleusercontent.com',
    iosBundleId: 'com.example.pokedexMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAurJai4mdK7uQyjdpEXaQ-QpCZNM7resQ',
    appId: '1:896487683242:ios:34c2975987e78ae4be8cd3',
    messagingSenderId: '896487683242',
    projectId: 'pokedex-flutter-91ccb',
    storageBucket: 'pokedex-flutter-91ccb.appspot.com',
    iosClientId: '896487683242-n80lsvl8imjv1aphd00b9cntd2irds47.apps.googleusercontent.com',
    iosBundleId: 'com.example.pokedexMobile.RunnerTests',
  );
}
