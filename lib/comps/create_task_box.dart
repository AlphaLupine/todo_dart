import 'package:flutter/material.dart';
import 'package:todo_app/comps/universal_button.dart';

class CreateTaskBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  CreateTaskBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),

            //Save or cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Save Button
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: UniversalButton(btnName: 'Save', onPressed: onSave),
                ),

                //Cancel Button
                UniversalButton(btnName: 'Cancel', onPressed: onCancel)
              ],
            ),

          ],
        ),
      ),
    );
  }
}