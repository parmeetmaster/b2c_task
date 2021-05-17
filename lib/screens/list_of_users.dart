
import 'package:b2c_task/utils/dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:b2c_task/providers/providersutils.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("User List"),),
        body: Container(
          child: Container(
            child: Consumer<UserProvider>(builder: (context, value, child) {
              return SmartRefresher(
                enablePullUp: true,
                enablePullDown: true,
                onLoading: () {
                  value.onloading();
                },
                onRefresh: () {
                  value.onrefresh();
                },
                controller: value.refreshController,
                child: ListView(
                  children: [
                    ...value.users.map((e) =>  Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                            NetworkImage("${e.avatar}"),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text('${e.firstName} ${e.lastName}'),
                          subtitle: Text('email @ ${e.email}'),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: (){
                            showDialog(context: context,
                                builder: (BuildContext context) {
                                  return AdvanceCustomAlert(onPressCancel: (){
                                   int index= value.users.indexOf(e);
                                    value.users.removeAt(index);
                                    value.notifyListeners();
                                  },);
                                });

                          },

                          // onTap: () => _showSnackBar('Delete'),
                        ),
                      ],
                    )            ),
                  ],
                  physics: BouncingScrollPhysics(),
                ),
              );
            }),
          ),
        ));
  }
}
