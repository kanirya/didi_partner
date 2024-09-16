// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyClPwQSSBUcWAT2e5hh4uM606FgQSQHpAA',
    appId: '1:1012001851655:web:05bfaf92e13f8a65961da2',
    messagingSenderId: '1012001851655',
    projectId: 'didirooms-258f6',
    authDomain: 'didirooms-258f6.firebaseapp.com',
    databaseURL: 'https://didirooms-258f6-default-rtdb.firebaseio.com',
    storageBucket: 'didirooms-258f6.appspot.com',
    measurementId: 'G-0C54TNVFJG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkLuy432CHnmYH_L5Bd285NBeSXro7Pnc',
    appId: '1:1012001851655:android:bc052dcddd981dac961da2',
    messagingSenderId: '1012001851655',
    projectId: 'didirooms-258f6',
    databaseURL: 'https://didirooms-258f6-default-rtdb.firebaseio.com',
    storageBucket: 'didirooms-258f6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCR26UCDXthiyxsZXUyA1CwUZLluXujuU4',
    appId: '1:1012001851655:ios:900d03d825a61d97961da2',
    messagingSenderId: '1012001851655',
    projectId: 'didirooms-258f6',
    databaseURL: 'https://didirooms-258f6-default-rtdb.firebaseio.com',
    storageBucket: 'didirooms-258f6.appspot.com',
    iosBundleId: 'com.example.didiPartner',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCR26UCDXthiyxsZXUyA1CwUZLluXujuU4',
    appId: '1:1012001851655:ios:900d03d825a61d97961da2',
    messagingSenderId: '1012001851655',
    projectId: 'didirooms-258f6',
    databaseURL: 'https://didirooms-258f6-default-rtdb.firebaseio.com',
    storageBucket: 'didirooms-258f6.appspot.com',
    iosBundleId: 'com.example.didiPartner',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyClPwQSSBUcWAT2e5hh4uM606FgQSQHpAA',
    appId: '1:1012001851655:web:05bfaf92e13f8a65961da2',
    messagingSenderId: '1012001851655',
    projectId: 'didirooms-258f6',
    authDomain: 'didirooms-258f6.firebaseapp.com',
    databaseURL: 'https://didirooms-258f6-default-rtdb.firebaseio.com',
    storageBucket: 'didirooms-258f6.appspot.com',
    measurementId: 'G-0C54TNVFJG',
  );
}
