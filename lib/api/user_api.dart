import 'package:b2c_task/api/core/api_base.dart';
import 'package:b2c_task/api/core/api_response.dart';
import 'package:b2c_task/model/user_model.dart';
import 'package:dio/dio.dart';

Dio? dio = ApiBase.getInstance();

class Api{

  Future<UsersModel?> getUsers(int? pageno) async {
    ApiResponse? resp =
   await ApiBase.baseFunction(() => dio!.get("/users?page=$pageno"));

    if (resp!.status == 200) {
      print(resp.status);
      return UsersModel.fromJson(resp.data);
    } else {
      return null;
    }
  }


}