
import 'package:first_app/screens/tabs.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
));

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, theme: theme, home: const MyClass()));
}

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs_Screen(),
    );
  }
}
