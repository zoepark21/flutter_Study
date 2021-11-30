import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_1123/Controller/my_controller.dart';
import 'package:study_1123/page/detail_page01.dart';
import 'exam_page.dart';
import 'getx_state.dart';
import 'page/getx_detail_page01.dart';

void main() {
  runApp(GetMaterialApp(
      title: 'MyApp',
      home: MyApp(),
      initialBinding: BindingsBuilder(() {
        Get.put(MyController());
      })));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    DetailPage01(),
    GetxDetailPage01(),
    getxState(),
    ExamPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플러터앱'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '라우트',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: '라우트 getx',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'state',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'state getx',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
