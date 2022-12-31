import 'dart:convert';

import 'package:api_last_demo/controller/API%20MANGER/credentials.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const BaseURL = "https://jsonplaceholder.typicode.com";

  static const BaseWeatherURL =
      "https://api.openweathermap.org/data/2.5/weather";

  static getUser() async {
    try {
      var response = await http.get(Uri.parse("$BaseURL/users"));
      // log(response.body);
      var orignalRes = jsonDecode(response.body);
      // print(orignalRes);
      return orignalRes;
    } catch (e) {
      print(e);
    }
  }

  static getWeatherByCity(city) async {
    var url = "$BaseWeatherURL?q=$city&appid=$ApiKey";

    try {
      var response = await http.get(Uri.parse(url));
      var responseData = jsonDecode(response.body);

      return responseData;
      

    } catch (e) {
      print(e);
    }
  }
}
