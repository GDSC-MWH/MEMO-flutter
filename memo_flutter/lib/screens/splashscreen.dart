import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(116, 158, 104, 1.0),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'M E',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 215, 134, 1.0),
                    ),
                  ),
                  Text(
                    'M O',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 215, 134, 1.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/Post-it-4suffix.png', // 이미지 파일의 경로를 설정하세요.
                width: 139,
                height: 161,
              ),
            ],
          ),
        ));
  }
}
