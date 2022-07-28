import 'dart:io';

import 'package:alstar/api.dart';
import 'package:alstar/models/terminal_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

Future<List> get_exam_list() async {
  final box = Hive.box('token');
  final token = box.get('token');
  print(token);

  final dio = Dio();
  final response = await dio.get(Api.userExamList,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}'}));

  print(response.data);
  var res_list = response.data['data'];
  // if (200 == response.statusCode) {
  //   final List<TerminalModel> terminalModel =
  //       terminalModelFromJson(response.data['data']);
  //   return terminalModel;
  // }
  print(res_list);
  Map to_send = {};
  for (final e in res_list) {
    print(e);
    print(e['exam_title']);
    print(e['student_id']);
    print(e['exam_type_class_id']);
    print(e['exam_title'].toString().substring(0, 4));
    if (!to_send.containsKey(e['exam_title'].toString().substring(0, 4))) {
      to_send[e['exam_title'].toString().substring(0, 4)] = [e];
    } else if (to_send
        .containsKey(e['exam_title'].toString().substring(0, 4))) {
      print(e);
      to_send[e['exam_title'].toString().substring(0, 4)] =
          to_send[e['exam_title'].toString().substring(0, 4)] + [e];
    }
  }
  print('!!!!!!!!!!!!!!!!!!!!!!=$to_send');

  return res_list;
}


