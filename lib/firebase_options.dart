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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCHZEptq_jp8HtLz4c4E-rnbQ6cjLSvQpM',
    appId: '1:291226983840:web:b4e39fea7f1ba35072d8c5',
    messagingSenderId: '291226983840',
    projectId: 'boost-ballistics',
    authDomain: 'boost-ballistics.firebaseapp.com',
    storageBucket: 'boost-ballistics.appspot.com',
    measurementId: 'G-634EQ5BEDP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeAumh_ygbEe2yVLOVLcihNo186lD41OA',
    appId: '1:291226983840:android:c8230e9f0206b97b72d8c5',
    messagingSenderId: '291226983840',
    projectId: 'boost-ballistics',
    storageBucket: 'boost-ballistics.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2WzZ9h_jOacuEKFSP-znHHcJqEdAuws4',
    appId: '1:291226983840:ios:4bc74963de4a2e5472d8c5',
    messagingSenderId: '291226983840',
    projectId: 'boost-ballistics',
    storageBucket: 'boost-ballistics.appspot.com',
    iosClientId: '291226983840-vq442j72dicttnq5j0lo3o7reoqpl2uj.apps.googleusercontent.com',
    iosBundleId: 'com.example.boostBallistics',
  );
}
