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
    apiKey: 'AIzaSyANJG5lkxkdu4E03ZFvBx5zhRLbGIjAiFc',
    appId: '1:338307666449:web:81ab3951c1543fb0e817b0',
    messagingSenderId: '338307666449',
    projectId: 'phone-otp-e2a4b',
    authDomain: 'phone-otp-e2a4b.firebaseapp.com',
    storageBucket: 'phone-otp-e2a4b.appspot.com',
    measurementId: 'G-GFYW76WXL1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0zxzEAzx_X0ejXO9fRqrHh5iFATK86YQ',
    appId: '1:338307666449:android:2c32d964d81afa5ee817b0',
    messagingSenderId: '338307666449',
    projectId: 'phone-otp-e2a4b',
    storageBucket: 'phone-otp-e2a4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGudZ30QT3JwchDtEfmyhEO3piXtS9MmU',
    appId: '1:338307666449:ios:fa118ed16029cfb6e817b0',
    messagingSenderId: '338307666449',
    projectId: 'phone-otp-e2a4b',
    storageBucket: 'phone-otp-e2a4b.appspot.com',
    androidClientId: '338307666449-i3vta2ghovfql15eg1fnlr68gjmsqin5.apps.googleusercontent.com',
    iosClientId: '338307666449-sbg8b8dnnjcspujr9oidma10ks08vuic.apps.googleusercontent.com',
    iosBundleId: 'com.example.oakInternshipAss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGudZ30QT3JwchDtEfmyhEO3piXtS9MmU',
    appId: '1:338307666449:ios:f20c4a49646059f7e817b0',
    messagingSenderId: '338307666449',
    projectId: 'phone-otp-e2a4b',
    storageBucket: 'phone-otp-e2a4b.appspot.com',
    androidClientId: '338307666449-i3vta2ghovfql15eg1fnlr68gjmsqin5.apps.googleusercontent.com',
    iosClientId: '338307666449-7f483qlo5qcmgra4nsq54k5qgpqlfch8.apps.googleusercontent.com',
    iosBundleId: 'com.example.oakInternshipAss.RunnerTests',
  );
}