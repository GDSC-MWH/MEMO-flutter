import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Home_Todo extends StatefulWidget {
  const Home_Todo({Key? key}) : super(key: key);

  @override
  State<Home_Todo> createState() => _Home_TodoState();
}

class _Home_TodoState extends State<Home_Todo> {
  late List<Todo> _todos;
  late TextEditingController _textController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _todos = [];
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                dataSource: TodoDataSource(_todos),
                monthViewSettings: const MonthViewSettings(showAgenda: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: "To-do를 입력하세요",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _addTodo(),
                    icon: const Icon(Icons.arrow_circle_up),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addTodo() {
    String title = _textController.text;
    if (title.isNotEmpty) {
      setState(() {
        _todos.add(
          Todo(
            Title: title,
            from: _selectedDate!,
            background: const Color(0xFF0F8644),
            isAllDay: false,
          ),
        );
        _textController.clear();
      });
    }
  }
}

class TodoDataSource extends CalendarDataSource {
  TodoDataSource(List<Todo> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].from;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Todo {
  Todo({
    required this.Title,
    required this.from,
    required this.background,
    required this.isAllDay,
  });

  String Title;
  DateTime from;
  Color background;
  bool isAllDay;
}
