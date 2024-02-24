
import 'package:first_app/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
));

void main() {
  runApp(const ProviderScope(child: MyClass()));
}

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: theme,
      home: const Tabs_Screen(),
    );
  }
}
