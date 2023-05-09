//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_project/ProfileMenuWidge.dart';
import 'package:my_project/ProfileScreen.dart';
import 'package:my_project/controllers/login_controller.dart';
import 'package:my_project/utils/global.colors.dart';
//import 'package:my_project/view/ProfileMenuWidge.dart';
import 'package:my_project/view/register.view.dart';
//import 'package:my_project/view/register.view.dart';
import 'package:my_project/view/widgets/social.login.dart';
import 'package:my_project/view/widgets/text.form.global.dart';
import 'package:my_project/view/widgets/button.global.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: GlobalColors.mainColor, // set the color to green
                        borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                       ),
                       ),
                        child:   Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left :60.0),
                                child: Center(
                                  child: Text(
                                    'Welcome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           Expanded(
                            child: Stack(
                              
                              children: [
                                Positioned(
                                  right: 30,
                                  bottom: -5,
                                  child: Image.asset(
                                    'assets/images/login2.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                      ),
                    /*
                    Container(
                      height: 150,
                      color: GlobalColors.mainColor, // set the color to green
                      alignment: Alignment.center,
                      child:
                      const Text(
                        'Bienvenue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 230,
                      ),
                    ),
                    const SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Center(
                          child: Text(
                            'Login to your account',
                            style : TextStyle(
                            color : GlobalColors.textColor,
                            fontSize: 18,
                            fontWeight:FontWeight.bold,
                          ),
                                            ),
                        ),
                      ),
                    const SizedBox(height: 15,),
                    ////Email Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormGlobal(
                        controller: loginController.emailController,
                        text:'Email',
                        obscure:false,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ////Password Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormGlobal(
                        controller: loginController.passwordController,
                        text:'Password',
                        obscure:true,
                        textInputType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ButtonGlobal(),
                    ),
                    const SizedBox(height: 25),
                    const SocialLogin(),
                  ],
            ),
          ),
        ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                ),
                InkWell(
                  onTap: (){
                    
                   Get.to(
                    RegisterView(),
                    );
                  },
                  child: Text(
                    'sign Up',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                    ),
                  ),
                )
            ],
          )
        ),
    );
  }
}