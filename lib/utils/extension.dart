

import 'package:b2c_task/screens/routes/custom_builder.dart';
import 'package:flutter/material.dart';

extension navigator on Widget {
  Future push(BuildContext context, {RouteSettings? settings}) {
    return Navigator.of(context).push(CustomPageRouteBuilder(
        pageBuilder: (c, a, b) => this, settings: settings));
  }

  Future pushReplacement(BuildContext context) {
    return Navigator.of(context).pushReplacement(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this));
  }

  Future pushAndPopAll(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this), (r) => false);
  }

  Future pushAndPopTillFirst(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteBuilder(pageBuilder: (c, a, b) => this),
            (r) => r.isFirst);
  }

  Future pushDialog(BuildContext context) {
    return Navigator.of(context).push(CustomPageRouteBuilder(
        pageBuilder: (c, a, b) => this,
        opaque: false,
        barrierColor: Colors.black45));
  }
}