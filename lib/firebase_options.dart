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
    apiKey: 'AIzaSyBXdZZU6lUMTfG_C0NyyIlnR4KNjFMmyCw',
    appId: '1:831426418205:web:f1d8e282627154876558f4',
    messagingSenderId: '831426418205',
    projectId: 'myfitness-dd018',
    authDomain: 'myfitness-dd018.firebaseapp.com',
    storageBucket: 'myfitness-dd018.appspot.com',
    measurementId: 'G-39R631J4CR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj0shWUVZbbUtmKnjPO2YJHefPzUpRq5c',
    appId: '1:831426418205:android:01aa358bcca999aa6558f4',
    messagingSenderId: '831426418205',
    projectId: 'myfitness-dd018',
    storageBucket: 'myfitness-dd018.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPFNudq88TPLJ03MyUJertg9bm8pAEVOU',
    appId: '1:831426418205:ios:cbc083533885c58a6558f4',
    messagingSenderId: '831426418205',
    projectId: 'myfitness-dd018',
    storageBucket: 'myfitness-dd018.appspot.com',
    iosBundleId: 'com.franciscogutierrez.whatToDo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPFNudq88TPLJ03MyUJertg9bm8pAEVOU',
    appId: '1:831426418205:ios:cbc083533885c58a6558f4',
    messagingSenderId: '831426418205',
    projectId: 'myfitness-dd018',
    storageBucket: 'myfitness-dd018.appspot.com',
    iosBundleId: 'com.franciscogutierrez.whatToDo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBXdZZU6lUMTfG_C0NyyIlnR4KNjFMmyCw',
    appId: '1:831426418205:web:5a0c1c088286da716558f4',
    messagingSenderId: '831426418205',
    projectId: 'myfitness-dd018',
    authDomain: 'myfitness-dd018.firebaseapp.com',
    storageBucket: 'myfitness-dd018.appspot.com',
    measurementId: 'G-J63HNSD2GW',
  );
}
