import 'package:flutter/material.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(255, 243, 219, 100)),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'My Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("default_profile.png"),
              ),
              SizedBox(height: 20),
              Text(
                'James',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('본인이 읽고 본인에 대해 되새길 수 있을 정도의 신상 정보 혹은 자기소개'),
            ],
          ),
        ),
      ),
    );
  }
}
