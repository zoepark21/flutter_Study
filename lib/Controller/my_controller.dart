import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:study_1123/model/exam_model.dart';

class MyController extends GetxController {
  final RxList<ExamItem> entries = <ExamItem>[].obs;

  void search(String searchword) async {
    Map<String, String> headers = Map();
    headers['X-Naver-Client-Id'] = 'MUVHiIgXlBMOsi27CqEh';
    headers['X-Naver-Client-Secret'] = '';

    Uri uri = Uri.parse(
        'https://openapi.naver.com/v1/search/movie.json?query=${searchword}&display=10&start=1&genre=1');
    await get(
      uri,
      headers: headers,
    ).then((response) {
      var a = utf8.decode(response.bodyBytes);
      var body = jsonDecode(a);
      var t = ExamModel.fromJson(body);
      entries.value = t.items ?? <ExamItem>[];
    }).catchError((dynamic, StackTrace) {
      Get.snackbar('error', dynamic.toString());
    });
  }
}
