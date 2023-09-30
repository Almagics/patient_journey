import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:patient_journey/screens/splash_screen.dart';

import 'constants/app_strings.dart';
import 'constants/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      title: AppString.appName,
      home: const SplashScreen(),
    );
  }
}
