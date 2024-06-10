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
    apiKey: 'AIzaSyB4gH2IgEdcxp1wNcqnhJk0vDFHpu332ik',
    appId: '1:31936570128:web:fe1799ed6e2ffaccd83b95',
    messagingSenderId: '31936570128',
    projectId: 'social-app-6905d',
    authDomain: 'social-app-6905d.firebaseapp.com',
    storageBucket: 'social-app-6905d.appspot.com',
    measurementId: 'G-N78KNC6SRL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKgCeoRDd-5G6DYOeXOPq_uOniW8ReV68',
    appId: '1:31936570128:android:c3c35a8b6915e360d83b95',
    messagingSenderId: '31936570128',
    projectId: 'social-app-6905d',
    storageBucket: 'social-app-6905d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpA4nKSrFSL382H0R_8GmAp4r7GH2eE1o',
    appId: '1:31936570128:ios:3bc4162d5f541bd1d83b95',
    messagingSenderId: '31936570128',
    projectId: 'social-app-6905d',
    storageBucket: 'social-app-6905d.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpA4nKSrFSL382H0R_8GmAp4r7GH2eE1o',
    appId: '1:31936570128:ios:3bc4162d5f541bd1d83b95',
    messagingSenderId: '31936570128',
    projectId: 'social-app-6905d',
    storageBucket: 'social-app-6905d.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4gH2IgEdcxp1wNcqnhJk0vDFHpu332ik',
    appId: '1:31936570128:web:4a1daf49e22d5327d83b95',
    messagingSenderId: '31936570128',
    projectId: 'social-app-6905d',
    authDomain: 'social-app-6905d.firebaseapp.com',
    storageBucket: 'social-app-6905d.appspot.com',
    measurementId: 'G-EQ43Y5EB7S',
  );
}
