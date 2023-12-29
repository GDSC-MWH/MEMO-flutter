import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';

class HomeReminder extends StatelessWidget {
  const HomeReminder({super.key});

  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    return Scaffold(
      body: CellCalendar(
        cellCalendarPageController: cellCalendarPageController,
      ),
    );
  }
}
