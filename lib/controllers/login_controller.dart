import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/view/home.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {

    try{
      var headers = {'Content-Type': 'application/json'};
      var url =  Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail
      ); 

      Map body = {
        'email' : emailController.text,
        'password' : passwordController.text
      };

      http.Response response = await http.post(url,body:jsonEncode(body),headers:headers);

      if(response.statusCode == 200)
      {
        final json = jsonDecode(response.body);
        if(json['status'] == 200)
        {
          var token = json['jwt'];
          print(json);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          await prefs?.setInt('userId', json['user']['id']);
          await prefs?.setString('firstName', json['user']['first_name']);
          await prefs?.setString('lastName', json['user']['last_name']);
          emailController.clear();
          passwordController.clear();
          Get.off(HomePage());
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