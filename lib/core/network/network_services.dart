import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:codex_flutter_g1/core/network/app_end_points.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkServices {
  static late Dio _dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    );
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      request: true,
      requestBody: true,
      error: true,
      compact: true,

    ));
    _dio.interceptors.add(ChuckerDioInterceptor(

    ));


  }

   Future<Either<String, dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      print("request url ===> ${_dio.options.baseUrl + endPoint}");
      final response = await _dio.get(endPoint,
          data: data,
        queryParameters: queryParameters,
      );
      print("app dio =====>  ${response.data}");
      return Right(response.data);
    } on DioException catch (e) {
      print("app dio error =====>  ${e.message}");
      return Left(e.response!.data['status_message']);
    }
  }

// TODO: add post function

// TODO: add put function

// TODO: add delete function
}
