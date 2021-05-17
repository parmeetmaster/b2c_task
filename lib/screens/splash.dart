import 'dart:async';

import 'package:b2c_task/screens/list_of_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'routes/custom_builder.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          CustomPageRouteBuilder(pageBuilder: (c, a, b) => UsersPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SvgPicture.asset(
          "assets/svgs/woman.svg",
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
