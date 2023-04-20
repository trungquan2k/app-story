import 'package:flutter/material.dart';
import 'package:project_test/feature/search/search.dart';
import 'package:project_test/feature/setting/setting.dart';
import 'package:project_test/feature/home/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    // Add your screens here
    HomePage(),
    SettingPage(),
    SearchPage(),
    SearchPage(),
    SearchPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Cộng đồng"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Setting"),
        ],
      ),
    );
  }
}
