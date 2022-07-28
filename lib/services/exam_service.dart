

import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:hive/hive.dart';


import '../views/result_page.dart';
void getHttp(String email, String password) async {
  try {
    // var response = await Dio().get('https://ems.allstar.com.np/');
    var response = await Dio().post('https://ems.allstar.com.np/api/v2/auth/login', data: {'email': email, 'password': password});
    print('token>>>>>${response.data['data']['token']}');
    print('token>>>>>${response.data}');
    String token = await response.data['data']['token'];
    final box = Hive.box('token');
    box.put('token', token);









    Get.to(() =>Result_page(), transition: Transition.fadeIn);
  } catch (e) {
    print(e);
  }
}






















// getProfile(String getToken) async {
//
//   var token = await getToken;
//   http.post(
//     "$url",
//     headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     },
//     encoding: Encoding.getByName("utf-8"),
//   ).then((response) {
//     print(datafromurl);
//     if (response.statusCode == 200) {
//       print(json.decode(response.body));
//     }
//   });
// }

//
//
// // import 'package:allstar/models/terminal_model.dart';
// import 'package:dio/dio.dart';
//
// class TerminalService {
//  late Dio _dio;
//   final baseUrl = 'https://ems.allstar.com.np/';
//
//
//   TerminalService(){
//     _dio = Dio(BaseOptions(
//       baseUrl: baseUrl,
//     ));
//     initializeInterceptors();
//   }
//   Future<Response> getRequest(String endPoint)async{
//     Response response;
//     try {
//       response = await _dio.get(endPoint);
//     } on DioError catch (e) {
//
//       print(e.message);
//       throw Exception(e.message);
//
//     }
//     return response;
//   }
//   initializeInterceptors(){
//     _dio.interceptors.add(InterceptorsWrapper(
//       onError: (error,Exception){
//         print(error.message);
//       },
//       onRequest: (request,Exception){
//         print("${request.method} ${request.path}");
//     },onResponse: (resopnse,Exception){
// print(resopnse.data);
//     }
//
//     ));
//   }
//   // Future<List<TerminalModel>>
//
//
//
//
//
//
//
// // }
// class TerminalModel {
//   final int id;
//   final int userId;
//   final String title;
//   final String body;
//
//   User({
//     this.id,
//     this.userId,
//     this.title,
//     this.body,
//   });
// }
