import 'package:flutter/material.dart';
import 'package:profile_editor/screens/home_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profile Editor App'),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Text('This is a drawer'),
          ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
