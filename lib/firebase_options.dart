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
    apiKey: 'AIzaSyANFEA9WCY2LcqT5btc3E0cdvB4sO9_7ro',
    appId: '1:39289379271:web:b2b1dbced914d6329da1e2',
    messagingSenderId: '39289379271',
    projectId: 'uaspemmob-f5fb1',
    authDomain: 'uaspemmob-f5fb1.firebaseapp.com',
    databaseURL: 'https://uaspemmob-f5fb1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'uaspemmob-f5fb1.appspot.com',
    measurementId: 'G-7PQM2D51CR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHFzIlfaLlzfz8TOB_dfqyYnWLNU_cdKw',
    appId: '1:39289379271:android:d41ddaa77a9085ef9da1e2',
    messagingSenderId: '39289379271',
    projectId: 'uaspemmob-f5fb1',
    databaseURL: 'https://uaspemmob-f5fb1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'uaspemmob-f5fb1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCljGsw2Z31LDEApc2UyklopjW2cwDIs0A',
    appId: '1:39289379271:ios:f96d7fd863e3c8aa9da1e2',
    messagingSenderId: '39289379271',
    projectId: 'uaspemmob-f5fb1',
    databaseURL: 'https://uaspemmob-f5fb1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'uaspemmob-f5fb1.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCljGsw2Z31LDEApc2UyklopjW2cwDIs0A',
    appId: '1:39289379271:ios:b6f443b7b250f0079da1e2',
    messagingSenderId: '39289379271',
    projectId: 'uaspemmob-f5fb1',
    databaseURL: 'https://uaspemmob-f5fb1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'uaspemmob-f5fb1.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
