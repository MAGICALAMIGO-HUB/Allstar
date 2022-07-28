import 'dart:io';

import 'package:alstar/models/terminal_model.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../api.dart';
import '../views/report_card_page.dart';

// void getReportCardHTML(TerminalModel terminalModel) async {
  void getReportCardHTML(int exam_type_class_id, int student_id) async {
    print(exam_type_class_id);
  final box = Hive.box('token');
  final token = box.get('token');
  try {
    // // var response = await Dio().get('https://ems.allstar.com.np/');
    var response = await Dio().get(
      Api.StudentResult,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${token}',
      }
    ),queryParameters: Map.from({"exam_type_class_id": exam_type_class_id}) );
    // print('token>>>>>${response.data['data']['token']}');

    // String token = await response.data['data']['token'];
    // final box = Hive.box('token');
    // box.put('token', token);

    // print('Output>>>>>${toSend}');



    // Get.to(() => Report_card_page(response.data), transition: Transition.fadeIn);
    Get.to(() => Report_card_page(response.data,exam_type_class_id,student_id), transition: Transition.fadeIn);
  } catch (e) {
    print(e);
  }
}
