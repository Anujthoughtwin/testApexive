import 'package:flutter/material.dart';
import 'package:test_apexive/create_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.transparent, // Set the background color for AppBar
        ),
      ),
      home: CreateTimer(),
    );
  }
}
