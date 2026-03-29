import 'package:flutter/material.dart';
import 'package:profile_editor/screens/home_screen.dart';

class ChangeUser extends StatefulWidget {
  final Function(Widget) screenSelection;
  final dynamic currentUser;
  const ChangeUser({
    required this.screenSelection,
    required this.currentUser,
    super.key,
  });

  @override
  State<ChangeUser> createState() => _ChangeUserState();
}

class _ChangeUserState extends State<ChangeUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'data',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          OutlinedButton(
            onPressed: () {
              widget.screenSelection(
                HomeScreen(
                  screenSelection: widget.screenSelection,
                  currentUser: widget.currentUser,
                ),
              );
            },
            child: Text('Return to Home Screen'),
          ),
        ],
      ),
    );
  }
}
