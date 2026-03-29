import 'package:flutter/material.dart';
import 'package:profile_editor/app_data/user_data.dart';
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
  late User selectedUser;

  @override
  void initState() {
    super.initState();
    selectedUser = widget.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome, ${widget.currentUser.name}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Change your user?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<User>(
                    value: selectedUser,
                    items: allUsers.map((User user) {
                      return DropdownMenuItem<User>(
                        value: user,
                        child: Text(user.name),
                      );
                    }).toList(),
                    onChanged: (User? newValue) {
                      setState(() {
                        selectedUser = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.currentUser.name = selectedUser.name;
              });
            },
            child: Text(
              'Change Profile',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          OutlinedButton(
            onPressed: () {
              widget.screenSelection(
                HomeScreen(
                  screenSelection: widget.screenSelection,
                  currentUser: selectedUser,
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
