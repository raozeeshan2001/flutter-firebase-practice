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
    apiKey: 'AIzaSyCXADGPRkB01NaACFPbGBxfzWivLuy18gk',
    appId: '1:743216669287:web:8923fd340390c37e50eac2',
    messagingSenderId: '743216669287',
    projectId: 'testing-cli-753c2',
    authDomain: 'testing-cli-753c2.firebaseapp.com',
    storageBucket: 'testing-cli-753c2.firebasestorage.app',
    measurementId: 'G-1GS421GLKG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKdxeoecuZYrUitss_RxrcDX4hGPd9yWU',
    appId: '1:743216669287:android:36212e8155d2aed750eac2',
    messagingSenderId: '743216669287',
    projectId: 'testing-cli-753c2',
    storageBucket: 'testing-cli-753c2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClx1OmgZyZvdaHRuC4jMgoPHYjeUH2CIE',
    appId: '1:743216669287:ios:7c7d8540065eadd650eac2',
    messagingSenderId: '743216669287',
    projectId: 'testing-cli-753c2',
    storageBucket: 'testing-cli-753c2.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebasePractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClx1OmgZyZvdaHRuC4jMgoPHYjeUH2CIE',
    appId: '1:743216669287:ios:7c7d8540065eadd650eac2',
    messagingSenderId: '743216669287',
    projectId: 'testing-cli-753c2',
    storageBucket: 'testing-cli-753c2.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebasePractice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXADGPRkB01NaACFPbGBxfzWivLuy18gk',
    appId: '1:743216669287:web:b22517f8a00c709850eac2',
    messagingSenderId: '743216669287',
    projectId: 'testing-cli-753c2',
    authDomain: 'testing-cli-753c2.firebaseapp.com',
    storageBucket: 'testing-cli-753c2.firebasestorage.app',
    measurementId: 'G-6BF3FY524P',
  );
}
