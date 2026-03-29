import 'package:flutter/material.dart';
import 'package:profile_editor/screens/change_user.dart';
import 'package:profile_editor/screens/edit_profile.dart';

class HomeScreen extends StatelessWidget {
  final Function(Widget) screenSelection;
  final dynamic currentUser;
  const HomeScreen({
    required this.screenSelection,
    required this.currentUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name: ${currentUser.name}',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Access Status: ${currentUser.isAdmin ? 'Pro' : 'Standard'}',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              screenSelection(
                EditScreen(
                  screenSelection: screenSelection,
                  currentUser: currentUser,
                ),
              );
            },
            child: const Text('Edit Profile'),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              screenSelection(
                ChangeUser(
                  screenSelection: screenSelection,
                  currentUser: currentUser,
                ),
              );
            },
            child: Text(
              'Change User',
            ),
          ),
        ],
      ),
    );
  }
}
