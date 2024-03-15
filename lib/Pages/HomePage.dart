import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/Auth_methods.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home Page"),
          ElevatedButton(
              onPressed: () {
                Auth.signOut(context);
              },
              child: const Text("SignOut"))
        ],
      )),
    );
  }
}
