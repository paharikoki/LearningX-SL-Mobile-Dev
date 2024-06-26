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
    apiKey: 'AIzaSyCcm21A-27C8QgIlY4rmF6mYs699KqylaA',
    appId: '1:618011346538:web:75c6ac35ae393f31876c13',
    messagingSenderId: '618011346538',
    projectId: 'chapter6-7acb4',
    authDomain: 'chapter6-7acb4.firebaseapp.com',
    storageBucket: 'chapter6-7acb4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvkrVAKPlhHGEkaDjXF-278lVV1HEnwyI',
    appId: '1:618011346538:android:745423e01f44a7a3876c13',
    messagingSenderId: '618011346538',
    projectId: 'chapter6-7acb4',
    storageBucket: 'chapter6-7acb4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNSSuDiArAtt96HQGFAzfDRDm16_JfxDM',
    appId: '1:618011346538:ios:516a7ee9f11ccd3e876c13',
    messagingSenderId: '618011346538',
    projectId: 'chapter6-7acb4',
    storageBucket: 'chapter6-7acb4.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNSSuDiArAtt96HQGFAzfDRDm16_JfxDM',
    appId: '1:618011346538:ios:516a7ee9f11ccd3e876c13',
    messagingSenderId: '618011346538',
    projectId: 'chapter6-7acb4',
    storageBucket: 'chapter6-7acb4.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcm21A-27C8QgIlY4rmF6mYs699KqylaA',
    appId: '1:618011346538:web:b52e2ed1a98e6e95876c13',
    messagingSenderId: '618011346538',
    projectId: 'chapter6-7acb4',
    authDomain: 'chapter6-7acb4.firebaseapp.com',
    storageBucket: 'chapter6-7acb4.appspot.com',
  );
}
