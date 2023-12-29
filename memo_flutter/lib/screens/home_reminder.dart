import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';

class Home_Reminder extends StatelessWidget {
  const Home_Reminder({super.key});

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
