import 'package:flutter/material.dart';
import 'package:profile_editor/screens/home_screen.dart';

class EditScreen extends StatefulWidget {
  final Function(Widget) screenSelection;
  const EditScreen({required this.screenSelection, super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('data', textAlign: TextAlign.center),
          SizedBox(
            height: 20.0,
          ),
          OutlinedButton(
            onPressed: () {
              widget.screenSelection(
                HomeScreen(screenSelection: widget.screenSelection),
              );
            },
            child: Text('Return to Home Screen'),
          ),
        ],
      ),
    );
  }
}
