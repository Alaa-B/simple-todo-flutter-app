import 'package:flutter/material.dart';

import 'mybutton.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.textControlller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController textControlller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                
                decoration: const InputDecoration(
                    hintText: 'Input you task here',
                    border: OutlineInputBorder()),
                controller: textControlller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save button
                MyButton(
                  onTap: onSave,
                  buttonText: 'save',
                ),
                const SizedBox(
                  width: 6,
                ),
                //cancel button
                MyButton(
                  onTap: onCancel,
                  buttonText: 'cancel',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
