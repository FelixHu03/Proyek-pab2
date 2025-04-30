import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/home_screen.dart';
import 'package:tes_proyek/screens/login_screen.dart';
import 'package:tes_proyek/screens/posting_screen.dart';
import 'package:tes_proyek/screens/register_screen.dart';
import 'package:tes_proyek/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PostingScreen(),
    );
  }
}
