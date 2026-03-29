import 'package:flutter/material.dart';
import 'package:profile_editor/app_data/user_data.dart';
import 'package:profile_editor/screens/change_user.dart';
import 'package:profile_editor/screens/edit_profile.dart';

class HomeScreen extends StatelessWidget {
  final Function screenSelection;
  const HomeScreen({required this.screenSelection, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name: ${allUsers[0].name}',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Access Status: ${allUsers[0].isAdmin ? 'Pro' : 'Standard'}',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              screenSelection(const EditScreen());
            },
            child: Text(
              'Edit Profile',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              screenSelection(const ChangeUser());
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
