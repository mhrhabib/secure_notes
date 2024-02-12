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
    apiKey: 'AIzaSyC9wBMEJ1WDl8WkUoxHqIVqPLvwClaTYxs',
    appId: '1:599030350718:ios:d4aadf3cf97a599eb6292f',
    messagingSenderId: '599030350718',
    projectId: 'fir-auth-demo-ec48c',
    storageBucket: 'fir-auth-demo-ec48c.appspot.com',
    iosClientId: '599030350718-rt5diuiggpna5fmco6k05teqm2km0f66.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthDemo',
  );
}
