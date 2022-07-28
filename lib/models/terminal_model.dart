//
//
//
// import 'package:hive/hive.dart';
//
//
// class TerminalModel {
//
//
//
//   // {
//   // "exam_title": "2078 - FIRST TERMINAL - 8",
//   // "student_id": 479,
//   // "exam_type_class_id": 73
//   // },
//
//   String exam_title;
//   int student_id;
//   int exam_type;
//
//   TerminalModel({required this.exam_title, required this.student_id, required this.exam_type});
//
//   factory TerminalModel.fromJson (Map<String, dynamic> json){
//     return TerminalModel(
//     exam_title: json['exam_title'],
//     student_id: json['student_id'],
//    exam_type: json['exam_type']);
//   }
//
//
//
//
//
//
//
//
// }

// To parse this JSON data, do
//
//     final terminalModel = terminalModelFromJson(jsonString);

import 'dart:convert';

List<TerminalModel> terminalModelFromJson(String str) => List<TerminalModel>.from(json.decode(str).map((x) => TerminalModel.fromJson(x)));

String terminalModelToJson(List<TerminalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TerminalModel {
  TerminalModel({
    required this.examTitle,
    required this.studentId,
    required this.examTypeClassId,
  });

  String examTitle;
  int studentId;
  int examTypeClassId;

  factory TerminalModel.fromJson(Map<String, dynamic> json) => TerminalModel(
    examTitle: json["exam_title"],
    studentId: json["student_id"],
    examTypeClassId: json["exam_type_class_id"],
  );

  Map<String, dynamic> toJson() => {
    "exam_title": examTitle,
    "student_id": studentId,
    "exam_type_class_id": examTypeClassId,
  };
}
