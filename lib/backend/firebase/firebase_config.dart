import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCEf1fekVsVjaj0lhvHEeL4EZdYxFzYbA4",
            authDomain: "bite-sized-finance-h0fl9m.firebaseapp.com",
            projectId: "bite-sized-finance-h0fl9m",
            storageBucket: "bite-sized-finance-h0fl9m.appspot.com",
            messagingSenderId: "930851589581",
            appId: "1:930851589581:web:5d8d6a05929cad9f6d8884"));
  } else {
    await Firebase.initializeApp();
  }
}
