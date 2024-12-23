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
    apiKey: 'AIzaSyCttkL9_wKXK7zuLPP5r-CiwfEAkYJmmhM',
    appId: '1:535281092603:web:9f2180e6fd019bf342ad5e',
    messagingSenderId: '535281092603',
    projectId: 'customer-system-bca9b',
    authDomain: 'customer-system-bca9b.firebaseapp.com',
    storageBucket: 'customer-system-bca9b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAANjnXjS1YR-ZDBLlLPpkiAuArh5EIQPI',
    appId: '1:535281092603:android:fd40880c43d2bb5242ad5e',
    messagingSenderId: '535281092603',
    projectId: 'customer-system-bca9b',
    storageBucket: 'customer-system-bca9b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMYj7cnsBVbUEXDYJOgz061ZCRLfxmTOI',
    appId: '1:535281092603:ios:070c66c2bc51e2a442ad5e',
    messagingSenderId: '535281092603',
    projectId: 'customer-system-bca9b',
    storageBucket: 'customer-system-bca9b.firebasestorage.app',
    iosBundleId: 'com.example.systemWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMYj7cnsBVbUEXDYJOgz061ZCRLfxmTOI',
    appId: '1:535281092603:ios:070c66c2bc51e2a442ad5e',
    messagingSenderId: '535281092603',
    projectId: 'customer-system-bca9b',
    storageBucket: 'customer-system-bca9b.firebasestorage.app',
    iosBundleId: 'com.example.systemWeb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCttkL9_wKXK7zuLPP5r-CiwfEAkYJmmhM',
    appId: '1:535281092603:web:0fced63da759bf5942ad5e',
    messagingSenderId: '535281092603',
    projectId: 'customer-system-bca9b',
    authDomain: 'customer-system-bca9b.firebaseapp.com',
    storageBucket: 'customer-system-bca9b.firebasestorage.app',
  );
}
