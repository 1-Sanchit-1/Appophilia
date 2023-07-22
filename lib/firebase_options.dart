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
    apiKey: 'AIzaSyCmSXR0uqjHYD75YgwUOe4J_EDSfida6Zs',
    appId: '1:410079293980:web:6d59d512fd9ccc45aaa5d9',
    messagingSenderId: '410079293980',
    projectId: 'loginfirebase-4e349',
    authDomain: 'loginfirebase-4e349.firebaseapp.com',
    databaseURL: 'https://loginfirebase-4e349-default-rtdb.firebaseio.com',
    storageBucket: 'loginfirebase-4e349.appspot.com',
    measurementId: 'G-HD9HVJ1MTY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyXAiOhA2pm8spX2C-1TRevUfJUKPev8Y',
    appId: '1:410079293980:android:c4bd9ead6d9a211eaaa5d9',
    messagingSenderId: '410079293980',
    projectId: 'loginfirebase-4e349',
    databaseURL: 'https://loginfirebase-4e349-default-rtdb.firebaseio.com',
    storageBucket: 'loginfirebase-4e349.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCf3dCwyBvYE_lQ73cjPL8Q1-O63DpuBdY',
    appId: '1:410079293980:ios:302bc4718219a616aaa5d9',
    messagingSenderId: '410079293980',
    projectId: 'loginfirebase-4e349',
    databaseURL: 'https://loginfirebase-4e349-default-rtdb.firebaseio.com',
    storageBucket: 'loginfirebase-4e349.appspot.com',
    androidClientId: '410079293980-3us9m0k97hm9utr02jttu4dqierqr3ga.apps.googleusercontent.com',
    iosClientId: '410079293980-ln1diq51ddg4gbm5h17421aqag9hg613.apps.googleusercontent.com',
    iosBundleId: 'com.example.appophilia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCf3dCwyBvYE_lQ73cjPL8Q1-O63DpuBdY',
    appId: '1:410079293980:ios:302bc4718219a616aaa5d9',
    messagingSenderId: '410079293980',
    projectId: 'loginfirebase-4e349',
    databaseURL: 'https://loginfirebase-4e349-default-rtdb.firebaseio.com',
    storageBucket: 'loginfirebase-4e349.appspot.com',
    androidClientId: '410079293980-3us9m0k97hm9utr02jttu4dqierqr3ga.apps.googleusercontent.com',
    iosClientId: '410079293980-ln1diq51ddg4gbm5h17421aqag9hg613.apps.googleusercontent.com',
    iosBundleId: 'com.example.appophilia',
  );
}