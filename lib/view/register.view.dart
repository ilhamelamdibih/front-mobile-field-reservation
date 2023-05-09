import 'package:flutter/material.dart';
import 'package:my_project/controllers/registration_controller.dart';
import 'package:my_project/view/widgets/button.register.global.dart';
import 'package:my_project/view/widgets/text.form.global.dart';
import 'package:my_project/view/widgets/social.login.dart';
import 'package:get/get.dart';
import '../utils/global.colors.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  RegistrationController registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*   const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'registerhna',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ), // TextStyle
                  ),
                ),*/ // Text
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo1.png',
                    width: 230,
                  ),
                ),

                const SizedBox(height: 50),
                Text(
                  'sign up',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ), // TextStyle
                ),

                const SizedBox(height: 15),

                //////fullname Input
                TextFormGlobal(
                  controller: registrationController.nameController,
                  text: 'fullname',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),

                /////email input
                TextFormGlobal(
                  controller: registrationController.emailController,
                  text: 'email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                /////password Input
                TextFormGlobal(
                  controller: registrationController.passwordController,
                  text: 'passwordoo',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                ///// password conf input
                // TextFormGlobal(
                //   controller: passwordconfController,
                //   text: 'password conf',
                //   textInputType: TextInputType.text,
                //   obscure: true,
                // ),

                const SizedBox(height: 10),
                const ButtonRegisterGlobal(),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ), // Column
          ), // Container
        ), // SafeArea
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
