import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_integrate_firebase_appcheck/app/app.dart';
import 'package:flutter_integrate_firebase_appcheck/bootstrap.dart';
import 'package:flutter_integrate_firebase_appcheck/di/di.dart';
import 'package:flutter_integrate_firebase_appcheck/firebase_options_development.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    // 1. debug provider
    // 2. safety net provider (deprecated)
    // 3. play integrity provider
    androidProvider: AndroidProvider.debug,
  );
  await bootstrap(() => const App());
}
