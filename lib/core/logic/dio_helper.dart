import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(baseUrl: "https://thimar.amr.aait-d.com/api/")
  );

  static Future<CustomResponse> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return CustomResponse(isSuccess: true,data: response.data, statusCode: response.statusCode);
    }on DioException catch(ex){
      return CustomResponse(isSuccess: false, data: ex.response?.data, statusCode: ex.response?.statusCode);
    }
  }

  static Future<CustomResponse> get(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.get(path, queryParameters: data);
      return CustomResponse(isSuccess: true,data: response.data, statusCode: response.statusCode);
    }on DioException catch(ex){
      return CustomResponse(isSuccess: false, data: ex.response?.data, statusCode: ex.response?.statusCode);
    }
  }
}

class CustomResponse {
  final String? msg;
  final bool isSuccess;
  final data;
  final int? statusCode;
  CustomResponse({this.msg = "", required this.isSuccess, this.data, this.statusCode});
}