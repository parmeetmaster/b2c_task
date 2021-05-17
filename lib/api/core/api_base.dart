import 'dart:io';

import 'package:b2c_task/api/core/api_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const base_url = "https://reqres.in/api";

abstract class Status {
// [Description("true")]
  static const Success = 200,

// [Description("false")]
      Failed = 400,
      EmptyModel = 202,
      Unauthorized = 401,
      Duplicate = 409,
      VerifyEmail = 5001;
}

abstract class ApiBase {
  static Dio? dio;



 static Dio? getInstance() {
    if (dio == null) {
      initialize();
    }
    return dio;
  }

  static void initialize() {
    dio = Dio(BaseOptions(
      baseUrl: base_url,
      receiveTimeout: 3000,
      connectTimeout: 30000,
    ))
      ..interceptors.add(PrettyDioLogger());
  }

 static  Future<ApiResponse>? baseFunction(ResponseCallback callback) async {
    Response? response;
    ApiResponse apiResponse = new ApiResponse();
    try {
       response = await callback();
      apiResponse.status = response.statusCode!;
      apiResponse.data = response.data;
      apiResponse.message = response.statusMessage;
    } on DioError catch (e) {
      apiResponse.status = response!.statusCode!;
      apiResponse.data = response.data;
      apiResponse.message = response.statusMessage;
    } on SocketException catch (e) {
      apiResponse.status = response!.statusCode!;
      apiResponse.data = response.data!;
      apiResponse.message = "No Internet";
    }

    return apiResponse;
  }
}

typedef Future<Response> ResponseCallback();
