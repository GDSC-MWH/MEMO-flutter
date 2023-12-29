import 'package:flutter/material.dart';
import 'package:memo_flutter/screens/home_reminder.dart';
import 'package:memo_flutter/screens/home_todo.dart';
import 'package:memo_flutter/screens/homescreen.dart';
import 'package:memo_flutter/screens/mypage.dart';
import 'package:memo_flutter/screens/people.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
