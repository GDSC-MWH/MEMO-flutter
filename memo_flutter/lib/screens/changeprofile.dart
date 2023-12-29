import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveData() async {
    _prefs.setString('name', nameController.text);
    _prefs.setString('info', infoController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('저장 완료')),
    );
  }

  Future<void> _loadData() async {
    final name = _prefs.getString('name');
    final info = _prefs.getString('info');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Name: $name, Info: $info')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            '정보 수정',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: '이름',
                            ),
                          ),
                          TextField(
                            controller: infoController,
                            decoration: const InputDecoration(
                              labelText: '정보',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _saveData();
                              Navigator.pop(context);
                            },
                            child: const Text('수정'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () {
              _loadData();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("/assets/default_profile.png"),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  _prefs.getString('name') ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Info: ${_prefs.getString('info') ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
