import 'package:b2c_task/api/user_api.dart';
import 'package:b2c_task/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserProvider extends ChangeNotifier {
  List<UserData> users = [];
  int pageno = 0;
  RefreshController refreshController = RefreshController(initialRefresh: true);

  _loadData(int pageno) async {
    UsersModel? model = await Api().getUsers(pageno);

    model!.data?.forEach((element) {
      users.add(element);
    });

    notifyListeners();
  }

  onrefresh() async {
    users = [];
    pageno = 0;
    await _loadData(pageno);
    await _loadData(++pageno);
    refreshController.refreshCompleted();
  }

  onloading() async {
    await _loadData(++pageno);
    refreshController.loadComplete();
  }
}
