import 'package:flutter/material.dart';

class PushAlarm extends StatefulWidget {
  const PushAlarm({super.key});

  @override
  State<PushAlarm> createState() => _PushAlarmState();
}

class _PushAlarmState extends State<PushAlarm> {
  bool isPushAlarmOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Push Alarms',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Add button pressed!');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '푸쉬 알람 ${isPushAlarmOn ? "끄기" : "켜기"}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Switch(
                  value: isPushAlarmOn,
                  onChanged: (value) {
                    setState(() {
                      isPushAlarmOn = value;
                    });
                    ('푸쉬 알람 ${isPushAlarmOn ? "끄기" : "켜기"} switch pressed!');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
