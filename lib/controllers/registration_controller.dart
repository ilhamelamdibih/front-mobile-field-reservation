import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/utils/api_endpoints.dart';
import 'package:my_project/view/login.view.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {

    try{
      var headers = {'Content-Type': 'application/json'};
      var url =  Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail
      );

      Map body = {
        'first_name' : nameController.text,
        'last_name' : nameController.text,
        'email' : emailController.text,
        'password' : passwordController.text
      };
        
     

      http.Response response = await http.post(url,body:jsonEncode(body),headers:headers);

      if(response.statusCode == 200)
      {
        final json = jsonDecode(response.body);
        if(json['status'] == 200)
        {
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(LoginView());
        }
        else{
          throw jsonDecode(response.body)['message'] ?? "Unknown Error Occured";
        }
      }
      else{
          throw jsonDecode(response.body)['message'] ?? "Unknown Error Occured";
        }
    }
    catch(e) {
      Get.back();
      showDialog(context: Get.context!, 
      builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(e.toString())],
        );
      });
    }
  }

}