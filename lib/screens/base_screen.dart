import 'package:flutter/material.dart';
import 'package:profile_editor/app_data/user_data.dart';
import 'package:profile_editor/screens/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late Widget currentScreen;
  var activeUser = allUsers[0];

  void switchScreen(Widget newScreen) {
    setState(() {
      currentScreen = newScreen;
    });
  }

  @override
  void initState() {
    super.initState();
    // 3. Pass the activeUser to the first HomeScreen
    currentScreen = HomeScreen(
      screenSelection: switchScreen,
      currentUser: activeUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          body: currentScreen,
        ),
      ),
    );
  }
}
