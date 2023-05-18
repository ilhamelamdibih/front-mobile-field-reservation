import 'dart:convert';
import 'package:my_project/models/reservation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReservationApi {


   

  static Future<List<Reservation>> getReservation() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    final response = await http.get(Uri.parse('https://kritirankk.pythonanywhere.com/entity/reservation-list'));

    final SharedPreferences prefs = await _prefs;
    
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    //Map data = jsonDecode(response.body);
    List temp = [];
     
    for (var i in data) {
      if(i["userId"] == prefs.get('userId'))
      {
        temp.add(i);
      }
    }


    return Reservation.ReservationsFromSanpshot(temp);
  }
}