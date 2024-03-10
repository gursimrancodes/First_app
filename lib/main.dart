import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AuthPage.dart';
import 'package:flutter_application_1/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCwq5IoMaNYwxGyQTjMUyVuVw-uouRtyic",
      appId: "1:920531833273:android:ff2b6d53819983ad73e668",
      messagingSenderId: "920531833273",
      projectId: "possible-ace-410212",
    ),
  );
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Somenthing went wrong"),
                );
              } else if (snapshot.hasData) {
                return const HomePage();
              }
              return const AuthPage();
            }));
  }
}
