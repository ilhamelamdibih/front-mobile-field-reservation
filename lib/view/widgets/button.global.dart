// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/login_controller.dart';
import 'package:my_project/utils/global.colors.dart';


class ButtonGlobal extends StatelessWidget {

  const ButtonGlobal({super.key});

  static LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       loginController.loginWithEmail();
      },
      child: Container(
        alignment: Alignment.center,
        height:55,
        decoration: BoxDecoration(
          color:GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color : Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ]
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.w600,
            fontSize: 20,
          ),
          ),
      ),
    );
  }
}