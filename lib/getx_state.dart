import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_1123/Controller/my_controller.dart';
import 'model/exam_model.dart';

class getxState extends StatelessWidget {
  MyController myController = Get.find();

  getxState({Key? key}) : super(key: key);

  final textController = TextEditingController();

  void search() {
    //myController.entries.add(textController.text);
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: Obx(() {
              return _MyListViewWidget(myController.entries.value);
            }),
          ),
          Flexible(
            flex: 1,
            child: TextField(
              controller: textController,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: search,
              child: const Text('search'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListViewWidget extends StatelessWidget {
  final List<ExamItem> entries;
  final List<int> colorCodes = [900, 700, 500, 300, 100];

  _MyListViewWidget(this.entries);

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          color: Colors.amber[colorCodes[index % colorCodes.length]],
          child: Center(
            child: Text(entries[index].title),
          ),
        ),
      );
}
