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
    apiKey: 'AIzaSyACB9r1b6ThieLcmzEBZHH2CmwVp8-4HCk',
    appId: '1:853196773303:web:f907045aeed6b2919eba32',
    messagingSenderId: '853196773303',
    projectId: 'vehicanich',
    authDomain: 'vehicanich.firebaseapp.com',
    storageBucket: 'vehicanich.appspot.com',
    measurementId: 'G-TLZ6VKWMZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDm8CTJorEzSWcUK-cejzRcDwvorza8JtQ',
    appId: '1:853196773303:android:f3fe04ac2d858ee19eba32',
    messagingSenderId: '853196773303',
    projectId: 'vehicanich',
    storageBucket: 'vehicanich.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqiy9y_ddTPBQxWF7erQbYlb6hvKNrZWg',
    appId: '1:853196773303:ios:22aa8d911de27a1f9eba32',
    messagingSenderId: '853196773303',
    projectId: 'vehicanich',
    storageBucket: 'vehicanich.appspot.com',
    iosBundleId: 'com.example.vehicanich',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqiy9y_ddTPBQxWF7erQbYlb6hvKNrZWg',
    appId: '1:853196773303:ios:22aa8d911de27a1f9eba32',
    messagingSenderId: '853196773303',
    projectId: 'vehicanich',
    storageBucket: 'vehicanich.appspot.com',
    iosBundleId: 'com.example.vehicanich',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACB9r1b6ThieLcmzEBZHH2CmwVp8-4HCk',
    appId: '1:853196773303:web:45f709e7d8f287da9eba32',
    messagingSenderId: '853196773303',
    projectId: 'vehicanich',
    authDomain: 'vehicanich.firebaseapp.com',
    storageBucket: 'vehicanich.appspot.com',
    measurementId: 'G-59N5LJ0SNJ',
  );
}
