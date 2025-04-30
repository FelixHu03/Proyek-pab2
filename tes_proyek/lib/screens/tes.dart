import 'package:flutter/material.dart';
import 'package:tes_proyek/screens/footer_screen.dart';

class Tes extends StatelessWidget {
  const Tes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('hai'),
          FooterScreen(currentIndex: 1)
        ],
      ),
    );
  }
}