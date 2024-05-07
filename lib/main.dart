import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> numbers = [];

  void onPressed() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFF4EDDB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Click Count",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            for (var n in numbers) Text("$n"),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.add_box_outlined),
              iconSize: 40,
            )
          ],
        ),
      ),
    ));
  }
}
