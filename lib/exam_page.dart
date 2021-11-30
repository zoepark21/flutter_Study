import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/my_controller.dart';
import 'model/exam_model.dart';

final textController = TextEditingController();

class ExamPage extends StatelessWidget {
  ExamPage({Key? key}) : super(key: key);
  MyController myController = Get.find();

  void search() {
    myController.search(textController.text);
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
              autofocus: true,
              controller: textController,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: search,
              child: const Text('검색'),
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
          child: Row(children: [
            entries[index].image.isNotEmpty
                ? CachedNetworkImage(imageUrl: entries[index].image)
                : Container(),
            Text(entries[index].title),
          ]),
        ),
      );
}
