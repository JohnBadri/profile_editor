import 'package:flutter/material.dart';
import 'package:profile_editor/screens/base_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen();
  }
}
