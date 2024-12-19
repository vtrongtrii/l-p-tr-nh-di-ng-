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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC4CCMe0TyP-dY02ot29x-J_z9DjBXboVs',
    appId: '1:748894024146:web:e920c31f5c3efdfc89d80b',
    messagingSenderId: '748894024146',
    projectId: 'project4-6ef76',
    authDomain: 'project4-6ef76.firebaseapp.com',
    storageBucket: 'project4-6ef76.firebasestorage.app',
    measurementId: 'G-2BS5KKHYQ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5dVlFFwj-eSEqQ468S3y3txIuY43YP4s',
    appId: '1:748894024146:android:b628b302c2d973cf89d80b',
    messagingSenderId: '748894024146',
    projectId: 'project4-6ef76',
    storageBucket: 'project4-6ef76.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjrPLWMUawAxELurp2NdYunCFj_sxD6DM',
    appId: '1:748894024146:ios:97ddce4ba0824c7989d80b',
    messagingSenderId: '748894024146',
    projectId: 'project4-6ef76',
    storageBucket: 'project4-6ef76.firebasestorage.app',
    iosBundleId: 'com.example.laptrinhdidong',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC4CCMe0TyP-dY02ot29x-J_z9DjBXboVs',
    appId: '1:748894024146:web:b4fe2b5b74d35a3089d80b',
    messagingSenderId: '748894024146',
    projectId: 'project4-6ef76',
    authDomain: 'project4-6ef76.firebaseapp.com',
    storageBucket: 'project4-6ef76.firebasestorage.app',
    measurementId: 'G-7H3927N9S1',
  );
}