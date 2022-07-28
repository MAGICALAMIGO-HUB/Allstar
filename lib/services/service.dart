import 'dart:io';

import 'package:alstar/models/terminal_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../api.dart';

class Service {
  static Future<List<TerminalModel>> get_exam_list()  async {
    try {
      final box = Hive.box('token');
      final token = box.get('token');
      final dio = Dio();
      final response = await dio.get(
          Api.userExamList,options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${token}'
      })


      );
      // print('-------------------------${(response.data['data']) [1]['exam_title']}');
     // final List<TerminalModel> data = (response.data['data'] as List).map((e) => TerminalModel.fromJson(e)).toList();
     //
     //  print(data[0].examTitle);
      print(response.data['data']);

      if (200== response.statusCode){
        print('hello');
        final List<TerminalModel> terminalModel = (response.data['data'] as List).map((e) => TerminalModel.fromJson(e)).toList();

        print('the length>>>>>>>>>>>>>>${terminalModel.length}');
        return terminalModel;
      }else {
        return <TerminalModel>[];
      }
    } catch (e) {
      return <TerminalModel>[];
    }

  }
  // static Future<List<TableRow>> all() async {
  //   final box = Hive.box('token');
  //   final token = box.get('token');
  //   final dio = Dio();
  //   final response = await dio.get(
  //       Api.userExamList,options: Options(headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     HttpHeaders.authorizationHeader: 'Bearer ${token}'
  //   })
  //
  //
  //   );
  //   List<TableRow> all = (response.data['data'] as List).map<TableRow>((item) {
  //     return item;
  //   }).toList();
  //   return <TableRow> [];
  // }


}
