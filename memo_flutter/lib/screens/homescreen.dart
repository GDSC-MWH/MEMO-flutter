import 'package:flutter/material.dart';
import 'package:memo_flutter/screens/home_reminder.dart';
import 'package:memo_flutter/screens/home_todo.dart';
import 'package:memo_flutter/screens/mypage.dart';
import 'package:memo_flutter/screens/people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const People(),
    const Mypage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: _selectedIndex == 0
              ? const TabBar(
                  tabs: [
                    Tab(text: 'Reminder'),
                    Tab(text: 'To-do'),
                  ],
                )
              : null,
        ),
        body: _selectedIndex == 0
            ? const TabBarView(
                children: [
                  Home_Reminder(),
                  Home_Todo(),
                ],
              )
            : _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'My',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
