import 'package:flutter/material.dart';
import 'package:memo_flutter/screens/address.dart';
import 'package:memo_flutter/screens/changeprofile.dart';
import 'package:memo_flutter/screens/emergency.dart';
import 'package:memo_flutter/screens/pushalarm.dart';

class MyPage extends StatefulWidget {
  // final String name, profile;

  const MyPage({
    super.key,
    // required this.name,
    // required this.profile,
  });

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("/assets/default_profile.png"),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildButton('나의 정보 변경', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeProfile()),
              );
            }),
            _buildButton('푸시 알림 설정', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PushAlarm()),
              );
            }),
            _buildButton('주소 설정', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Address()),
              );
            }),
            _buildButton('비상 연락망 설정', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Emergency()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black, width: 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
