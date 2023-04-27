import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/models/filed2.dart';

class Field2Api {


  
  static Future<List<Field2>> getField() async {

    final response = await http.get(Uri.parse('https://kritirankk.pythonanywhere.com/entity/list_fields/'));
    
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    //Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data) {
      temp.add(i);
    }

    return Field2.fields2FromSanpshot(temp);
  }
}