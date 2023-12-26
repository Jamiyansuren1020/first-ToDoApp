import 'package:flutter/material.dart';
import 'package:to_do_app_local/utilities/buttons.dart';

class MyDialog extends StatelessWidget {
  final titleController;
  final subtitleController;
  VoidCallback onSave;
  VoidCallback onCancel;

   MyDialog({
    super.key,
    required this.titleController,
    required this.subtitleController,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.greenAccent,
      content: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Add new task"),
            ),
            const SizedBox(height: 5,),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Add subtitle"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(btnText: 'Cancel' , onPressed: onCancel),
                MyButton(btnText: 'Save', onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}