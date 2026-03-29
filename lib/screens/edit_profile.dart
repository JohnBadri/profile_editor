import 'package:flutter/material.dart';
import 'package:profile_editor/screens/home_screen.dart';

class EditScreen extends StatefulWidget {
  final Function(Widget) screenSelection;
  final dynamic currentUser;
  const EditScreen({
    required this.screenSelection,
    required this.currentUser,
    super.key,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late bool dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.currentUser.isAdmin;
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
                'Change your name?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    controller: _textEditingController,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Change your admin?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<bool>(
                    value: dropDownValue, // Don't forget to link the value!
                    // Fix 2: Map the bool list to DropdownMenuItems
                    items: <bool>[true, false].map((bool value) {
                      return DropdownMenuItem<bool>(
                        value: value,
                        child: Text(value ? 'Yes' : 'No'),
                      );
                    }).toList(),
                    onChanged: (bool? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
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
                widget.currentUser.name = _textEditingController.text;
                widget.currentUser.isAdmin = dropDownValue;
              });
              _textEditingController.clear();
            },
            child: Text(
              'Update Profile',
            ),
          ),
          SizedBox(
            height: 20,
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
