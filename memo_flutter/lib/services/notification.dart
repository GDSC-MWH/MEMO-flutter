import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationManager {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotificationManager({required this.flutterLocalNotificationsPlugin});

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    const String notiTitle = '당신의 하루를 추억해보세요';
    const String notiDesc = '오늘 하루 있었던 일이 궁금하지 않으신가요?';

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.max,
      color: Color.fromARGB(255, 95, 95, 95),
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      notiTitle,
      notiDesc,
      _setNotiTime(),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
    );
  }

  tz.TZDateTime _setNotiTime() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, now.hour, now.minute);
    return scheduledDate;
  }

  Future<void> onSelectNotification(String? payload) async {}

  Widget buildNotificationUI() {
    return FutureBuilder(
      future: onSelectNotification(null),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('알림 선택 완료');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
