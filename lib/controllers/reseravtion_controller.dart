import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/screens/details_screen.dart';
import 'package:intl/intl.dart';


class ReservationController extends GetxController{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  Future<void> ReservationFull(DateTime dateTime,String startTime,String endTime,int terrain) async {

    final SharedPreferences prefs = await _prefs;

    try{
      var headers = {'Content-Type': 'application/json'};
      var url =  Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.reservationEndPoints.reservation
      ); 

      Map body = {
        'date' : DateFormat('yyyy-MM-dd').format(dateTime),
        'startTime' : startTime,
        'endTime' : endTime,
        'terrain' : terrain,
        'jwt' : prefs.get('token'),
        'approved_rejected' : "waiting"
      };

      print(body);

      http.Response response = await http.post(url,body:jsonEncode(body),headers:headers);

      if(response.statusCode == 200)
      {
        final json = jsonDecode(response.body);
        print(json);
        if(json['status'] == 200)
        {
                showDialog(context: Get.context!, 
                builder: (context){
                  return SimpleDialog(
                    title: Text('Success'),
                    contentPadding: EdgeInsets.all(20),
                    children: [Text(json['message'])],
                  );
                });
          Get.off(DetailsScreen());
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