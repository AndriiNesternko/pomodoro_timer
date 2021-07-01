import 'package:flutter/material.dart';
import 'info_screen.dart';

enum TopButtons { pomodoro, shortBreak, longBreak }

class PomodoroScreen extends StatefulWidget {
  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen>
    with TickerProviderStateMixin {
  TopButtons selectedButton = TopButtons.pomodoro;
  late AnimationController controller;
  int _seconds = 1500;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    updateTimer(_seconds);
  }

  void updateTimer(int seconds) {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: seconds + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.redAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTopTextButton(1500, TopButtons.pomodoro, 'Pomodoro'),
                buildTopTextButton(300, TopButtons.shortBreak, 'Short break'),
                buildTopTextButton(900, TopButtons.longBreak, 'Long break'),
              ],
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? child) => Text(
                timerString,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 130.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (controller.isAnimating) {
                    controller.stop(canceled: true);
                  } else {
                    controller.reverse(
                        from: controller.value == 0.0 ? 1.0 : controller.value);
                  }
                });
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                primary: Colors.redAccent,
                textStyle: TextStyle(fontSize: 70.0),
                backgroundColor: Colors.white,
              ),
              child: Text(controller.isAnimating ? 'Pause' : 'Start'),
            ),
            SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.redAccent,
      title: Text('Pomodoro Timer'),
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoScreen()),
            );
          },
        )
      ],
    );
  }

  TextButton buildTopTextButton(
      int seconds, TopButtons topButton, String title) {
    final Color _inactiveColor = Colors.redAccent;
    final Color _activeColor = Colors.white24;
    return TextButton(
      onPressed: () {
        setState(() {
          selectedButton = topButton;
          updateTimer(seconds);
        });
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
        textStyle: TextStyle(fontSize: 20.0),
        backgroundColor:
            selectedButton == topButton ? _activeColor : _inactiveColor,
      ),
      child: Text(title),
    );
  }
}
