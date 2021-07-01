import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '1. Decide on the task to be done.\n'
              '2. Set the pomodoro timer (traditionally to 25 minutes).\n'
              '3. Work on the task.\n'
              '4. End work when the timer rings and put a checkmark on a piece of paper.\n'
              '5. If you have fewer than four checkmarks, take a short break (3–5 minutes) and then return to step 2; otherwise continue to step 6.\n'
              '6. After four pomodoros, take a long break (15–30 minutes), reset your checkmark count to zero, then go to step 1.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              primary: Colors.redAccent,
              textStyle: TextStyle(fontSize: 45.0),
              backgroundColor: Colors.white,
            ),
            child: Text('Understand'),
          ),
        ],
      ),
    );
  }
}
