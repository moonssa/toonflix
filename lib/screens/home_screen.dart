import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initialSeconds = 10;
  int totalSeconds = initialSeconds;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = initialSeconds;
        isRunning = false;
        totalPomodoros += 1;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = initialSeconds;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return (duration.toString().split(".").first.substring(2, 7));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
              flex: 12,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 88,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 23,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(30, 0),
                      child: IconButton(
                        iconSize: 120,
                        color: Theme.of(context).cardColor,
                        icon: Icon(
                          isRunning
                              ? Icons.pause_circle_outline_outlined
                              : Icons.play_circle_outline,
                        ),
                        onPressed: isRunning ? onStopPressed : onStartPressed,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(10, 20),
                      child: IconButton(
                        iconSize: 40,
                        color: Theme.of(context).cardColor,
                        icon: const Icon(
                          Icons.refresh_outlined,
                        ),
                        onPressed: onResetPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(45)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pomodors",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.color,
                              ),
                            ),
                            Text(
                              "$totalPomodoros",
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.color,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
