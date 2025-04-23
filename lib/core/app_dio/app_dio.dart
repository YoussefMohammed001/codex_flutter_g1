import 'package:codex_flutter_g1/core/app_dio/end_points.dart';
import 'package:dio/dio.dart';

class AppDio{
static late Dio _dio;

static init(){
  BaseOptions options = BaseOptions(
    baseUrl:EndPoints.baseUrl,
    headers: {
      "lang":"en",
      "Content-Type":"application/json",
      "Accept":"application/json"
    },
    receiveTimeout:Duration(seconds: 60),
    connectTimeout:Duration(seconds: 60),
  );
 _dio = Dio(options);
}

static getData({
  required String endPoint,
Map<String,dynamic> data = const {},
Map<String,dynamic> queryParameters = const {},
}) async {
  try{

    print("request url ===> ${_dio.options.baseUrl+endPoint}");
    final response = await _dio.get(endPoint,
        data: data,
        queryParameters:queryParameters
    );
    print("app dio =====>  ${response.data}");
    return response;
  } on DioException catch(e){
    print("app dio error =====>  ${e.response}");
  }
}


// TODO: add post function
  static postData({
    required String endPoint,
    Map<String,dynamic> data = const {},
    Map<String,dynamic> queryParameters = const {},
  }) async {
    try{
      print("request url ===> ${_dio.options.baseUrl+endPoint}");
      final response = await _dio.post(endPoint,
          data: data,
          queryParameters:queryParameters
      );
      print("app dio =====>  ${response.data}");
      return response;
    } on DioException catch(e){
      print("app dio error =====>  ${e.message}");
      print("app dio error =====>  ${e.response}");
    }
  }

// TODO: add put function

// TODO: add delete function



}