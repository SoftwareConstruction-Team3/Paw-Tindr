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
    apiKey: 'AIzaSyAdbwrSlL2iCl0zJUPVPgs4HjT2FIYwzns',
    appId: '1:34739762221:web:a4a912ebfcecf3666db4a4',
    messagingSenderId: '34739762221',
    projectId: 'paw-tindr',
    authDomain: 'paw-tindr.firebaseapp.com',
    storageBucket: 'paw-tindr.appspot.com',
    measurementId: 'G-5MN9ZCS63N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjWY5vRGIxdfTsnIVWwKOp7IePjwTutEE',
    appId: '1:34739762221:android:c6f8d862b9b56ae86db4a4',
    messagingSenderId: '34739762221',
    projectId: 'paw-tindr',
    storageBucket: 'paw-tindr.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBurStERcJZNc52Vm1_LQUG5BBdZqzCaA8',
    appId: '1:34739762221:ios:5d364d803ce633ac6db4a4',
    messagingSenderId: '34739762221',
    projectId: 'paw-tindr',
    storageBucket: 'paw-tindr.appspot.com',
    iosClientId: '34739762221-gpaa49b0jccttvvbhbanqhcujdkavu8v.apps.googleusercontent.com',
    iosBundleId: 'com.example.pawTindr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBurStERcJZNc52Vm1_LQUG5BBdZqzCaA8',
    appId: '1:34739762221:ios:5d364d803ce633ac6db4a4',
    messagingSenderId: '34739762221',
    projectId: 'paw-tindr',
    storageBucket: 'paw-tindr.appspot.com',
    iosClientId: '34739762221-gpaa49b0jccttvvbhbanqhcujdkavu8v.apps.googleusercontent.com',
    iosBundleId: 'com.example.pawTindr',
  );
}
