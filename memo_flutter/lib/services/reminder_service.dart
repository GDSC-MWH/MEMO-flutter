import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ReminderController {
  late String formattedDate;
  late List<MultipartFile> files;
  late String diary;

  void updateFormattedDate(String date) {
    formattedDate = date;
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api/records/load/{date}'));

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> postDataToServer() async {
    final response = await http.post(
      Uri.parse('https://api/records/save'),
      body: {
        'date': formattedDate,
        'files': files, // 선택된 사진의 경로를 전송하거나 필요에 따라 수정
        'diary': diary,
      },
    );
    if (response.statusCode == 200) {
      print('Post successful');
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
