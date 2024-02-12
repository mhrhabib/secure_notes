import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtKXnluWmso-W18XyMX47qOQGddZ1HVag',
    appId: '1:1079181170307:android:6b891eb99187d478546db6',
    messagingSenderId: '1079181170307',
    projectId: 'notes-99914',
    storageBucket: 'notes-99914.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtKXnluWmso-W18XyMX47qOQGddZ1HVag',
    appId: '1:1079181170307:android:6b891eb99187d478546db6',
    messagingSenderId: '1079181170307',
    projectId: 'notes-99914',
    storageBucket: 'notes-99914.appspot.com',
    iosClientId: '1079181170307-4n380jfql5fllqag8ificr4fj2l3ra2o.apps.googleusercontent.com',
    iosBundleId: 'com.example.secureNotes',
  );
}
