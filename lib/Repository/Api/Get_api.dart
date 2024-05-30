import 'dart:convert';

import 'package:covid_tracker/Models/World_state_data.dart';
import 'package:covid_tracker/Models/countries_data.dart';
import 'package:covid_tracker/Repository/Urls/Urls.dart';
import 'package:http/http.dart' as  http;

class State_service {
 Future<WorldStateData> get_data() async {
    http.Response response = await http.get(Uri.parse(appurl.all));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateData.fromJson(data);
    }
    else {
      throw Exception('Error');
    }
  }
Future<List<dynamic>> get_countries_data()async{
   http.Response response = await http.get(Uri.parse(appurl.countries));
   if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     return data;
   }

   else{
     throw Exception('eroor');
   }
}

}