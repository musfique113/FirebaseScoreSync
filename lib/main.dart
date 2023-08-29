import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livescore_firebase/app.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for Firebase initialization
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const LiveScoreFirebase());
}