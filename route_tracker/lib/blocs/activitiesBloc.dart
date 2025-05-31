import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class ActivitiesBloc extends ChangeNotifier{

  List<Map<String, dynamic>> _visits = [];


  List<Map<String, dynamic>> get visits => _visits;

  set visits(List<Map<String,dynamic>>value){
    _visits = value;
    notifyListeners();
  }
  final base_url = dotenv.env['SUPABASE_URL'];
  final apiKey =  dotenv.env['API_KEY'];
/**
 * visits payload response format
  [{
  "id": 11,
  "customer_id": 1,
  "visit_date": "2023-10-01T10:00:00+00:00",
  "status": "Completed",
  "location": "123 Main St, Springfield",
  "notes": "Discussed new product features.",
  "activities_done": ["1", "2"],
  "created_at": "2025-04-30T05:23:03.034139+00:00"

  }]
    */

  Future<void> getVisits() async{
   var url = Uri.parse("${base_url}visits");

   var headers = {
     "apikey": apiKey.toString(),
     "Content-Type": "application/json"
   };
  try {
   var response = await http.get(url,headers: headers).timeout(Duration(minutes: 4));

   if (response.statusCode == 200){
     final List<dynamic> data = jsonDecode(response.body);
     visits = List<Map<String, dynamic>>.from(data);
   }else if(response.statusCode >= 400 && response.statusCode <= 499){
     print("There was a format or permission issue");

   }else{
     print("There was an issue processing your request");
   }
  }catch(error){
    print("There was an error: ");
    print(error);
  }


  }

}