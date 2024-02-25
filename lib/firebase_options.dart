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
    apiKey: 'AIzaSyBSk5Z9nvma6DhBw7TYYnM_rhahaNuftms',
    appId: '1:690104518018:web:a417d646eb4c51646f7b9b',
    messagingSenderId: '690104518018',
    projectId: 'axndlogin',
    authDomain: 'axndlogin.firebaseapp.com',
    storageBucket: 'axndlogin.appspot.com',
    measurementId: 'G-YJ3HRHRCFC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBo-Q4BKchSYtcjcYxS8HJVoYZu2UXhXII',
    appId: '1:690104518018:android:02864491c140ac6a6f7b9b',
    messagingSenderId: '690104518018',
    projectId: 'axndlogin',
    storageBucket: 'axndlogin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZrgPAv8BeoZmZ2fE4ughUCT4COtVajn0',
    appId: '1:690104518018:ios:4e66d1167a26ca2c6f7b9b',
    messagingSenderId: '690104518018',
    projectId: 'axndlogin',
    storageBucket: 'axndlogin.appspot.com',
    iosBundleId: 'com.axnd.axndlogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZrgPAv8BeoZmZ2fE4ughUCT4COtVajn0',
    appId: '1:690104518018:ios:2cdf34beb3ac7e436f7b9b',
    messagingSenderId: '690104518018',
    projectId: 'axndlogin',
    storageBucket: 'axndlogin.appspot.com',
    iosBundleId: 'com.axnd.axndlogin.RunnerTests',
  );
}
