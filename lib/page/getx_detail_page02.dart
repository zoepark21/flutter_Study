import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxDetailPage02 extends StatelessWidget {
  const GetxDetailPage02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetxDetailPage02'),
        ),
        body: Column(
          children: [
            Text('GetxDetailPage02'),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text('뒤로가기'),
            )
          ],
        ));
  }
}
