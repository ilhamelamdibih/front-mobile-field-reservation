import 'package:flutter/material.dart';
import 'package:my_project/view/widgets/button.global.dart';
import 'package:my_project/view/widgets/text.form.global.dart';
import 'package:my_project/view/widgets/social.login.dart';

import '../utils/global.colors.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordconfController = TextEditingController();
  
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
                  controller: fullnameController,
                  text: 'fullname',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),

                /////email input
                TextFormGlobal(
                  controller: emailController,
                  text: 'email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                /////password Input
                TextFormGlobal(
                  controller: passwordController,
                  text: 'passwordoo',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                ///// password conf input
                TextFormGlobal(
                  controller: passwordconfController,
                  text: 'password conf',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),

                const SizedBox(height: 10),
                const ButtonGlobal(),
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
