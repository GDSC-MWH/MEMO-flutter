import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class Home_Reminder extends StatefulWidget {
  const Home_Reminder({Key? key}) : super(key: key);

  @override
  State<Home_Reminder> createState() => _Home_ReminderState();
}

class _Home_ReminderState extends State<Home_Reminder> {
  late Map<DateTime, List<dynamic>> _events;
  late TextEditingController _textController;
  late CellCalendarPageController _controller;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _events = {};
    _controller = CellCalendarPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CellCalendar(
        cellCalendarPageController: _controller,
        events: const [],
        onCellTapped: (date) {
          _showAddDialog(date);
        },
      ),
    );
  }

  _showAddDialog(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String diary = '';
    List<MultipartFile> files = [];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: _textController,
              onChanged: (value) {
                diary = value;
              },
              decoration: const InputDecoration(labelText: 'Enter Text'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Use image_picker to pick an image from the gallery
                final imagePicker = ImagePicker();
                final pickedFile =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  List<int> imageBytes = await pickedFile.readAsBytes();
                  String fileName = 'image${files.length + 1}.jpg';
                  MultipartFile imageFile =
                      MultipartFile.fromBytes(imageBytes, filename: fileName);
                  files.add(imageFile);
                }
              },
              child: const Text('Add Image'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Save"),
            onPressed: () {
              if (_textController.text.isEmpty) return;
              setState(() {
                if (_events[date] != null) {
                  _events[date]!.add({
                    'text': _textController.text,
                    // Add other properties as needed
                  });
                } else {
                  _events[date] = [
                    {
                      'text': _textController.text,
                      // Add other properties as needed
                    }
                  ];
                }
              });
              Navigator.pop(context); // Close the dialog after saving
            },
          )
        ],
      ),
    );
  }
}
