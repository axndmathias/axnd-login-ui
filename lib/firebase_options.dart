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
    apiKey: 'AIzaSyCDEC74nYtPFHxBRjWLfXFfr_xeo8ADPOU',
    appId: '1:975390685537:web:d3f1c5d9aee5c23df12d20',
    messagingSenderId: '975390685537',
    projectId: 'authlogin-c99e8',
    authDomain: 'authlogin-c99e8.firebaseapp.com',
    storageBucket: 'authlogin-c99e8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASZQ0gZUUpu7a2eMeo4rqd4Sp91vRGIwc',
    appId: '1:975390685537:android:b9995890e7d40358f12d20',
    messagingSenderId: '975390685537',
    projectId: 'authlogin-c99e8',
    storageBucket: 'authlogin-c99e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8ER6eg4yaTEPe2Exb2jIWGf2uBpGqiG8',
    appId: '1:975390685537:ios:939ac47720ab750af12d20',
    messagingSenderId: '975390685537',
    projectId: 'authlogin-c99e8',
    storageBucket: 'authlogin-c99e8.appspot.com',
    iosBundleId: 'com.axnd.axndlogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8ER6eg4yaTEPe2Exb2jIWGf2uBpGqiG8',
    appId: '1:975390685537:ios:604bf6299a18dfacf12d20',
    messagingSenderId: '975390685537',
    projectId: 'authlogin-c99e8',
    storageBucket: 'authlogin-c99e8.appspot.com',
    iosBundleId: 'com.axnd.axndlogin.RunnerTests',
  );
}
