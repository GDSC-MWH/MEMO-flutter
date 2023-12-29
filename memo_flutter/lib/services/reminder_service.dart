import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ReminderController {
  late String formattedDate;
  late XFile? selectedPhoto;
  late String diary;

  void updateFormattedDate(String date) {
    formattedDate = date;
  }

  void updateSelectedPhoto(XFile? photo) {
    selectedPhoto = photo;
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https:///api/records/save'));

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> postDataToServer() async {
    final response = await http.post(
      Uri.parse('https://api.example.com/post-data'),
      body: {
        'date': formattedDate,
        'photo': selectedPhoto?.path ?? '', // 선택된 사진의 경로를 전송하거나 필요에 따라 수정
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
