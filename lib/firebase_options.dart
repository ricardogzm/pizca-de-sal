// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  static final _androidApiKey = dotenv.get("ANDROID_API_KEY");
  static final _androidAppId = dotenv.get("ANDROID_APP_ID");

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: _androidApiKey,
    appId: _androidAppId,
    messagingSenderId: '564599616202',
    projectId: 'pizca-de-sal',
    storageBucket: 'pizca-de-sal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: String.fromEnvironment("IOS_API_KEY"),
    appId: String.fromEnvironment("IOS_APP_ID"),
    messagingSenderId: '564599616202',
    projectId: 'pizca-de-sal',
    storageBucket: 'pizca-de-sal.appspot.com',
    iosClientId:
        '564599616202-r05s61g2f9s5to09tse1u9r0rdq5nef3.apps.googleusercontent.com',
    iosBundleId: 'com.pizcadesal.app',
  );
}
