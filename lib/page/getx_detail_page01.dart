import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_1123/page/getx_detail_page02.dart';

class GetxDetailPage01 extends StatelessWidget {
  const GetxDetailPage01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('GetXRoute'),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Get.to(GetxDetailPage02());
          },
          child: Container(
            height: 100,
            child: Center(
              child: Text('GetxDetailPage02'),
            ),
          ),
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
