import 'package:flutter/material.dart';
import 'package:memo_flutter/screens/Mypage/mypage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(
          // name: ,
          // profile: ,
          ),
    );
  }
}
