import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ActivitiesBloc extends ChangeNotifier{

  List<Map<String, dynamic>> _visits = [];


  get visits => _visits;

  set visits(value){
    _visits = value;
    notifyListeners();
  }
  static final base_url = "https://kqgbftwsodpttpqgqnbh.supabase.co/rest/v1/";
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
   var url = Uri.parse("$base_url/visits");
   var headers = {
     "apikey":"",
     "Content-Type": "application/json"
   };

   var response = await http.get(url,headers: headers).timeout(Duration(minutes: 4));

   if (response.statusCode == 200){

   }


  }

}