import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/utils/global.colors.dart';
import 'package:my_project/view/login.view.dart';

import 'home.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),(){
      //LoginView
      Get.to(HomePage());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}