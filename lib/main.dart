import 'package:flutter/material.dart';
import 'screens/pomodoro_screen.dart';

void main() => runApp(PomodoroTimerApp());

class PomodoroTimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PomodoroScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro timer',
    );
  }
}
