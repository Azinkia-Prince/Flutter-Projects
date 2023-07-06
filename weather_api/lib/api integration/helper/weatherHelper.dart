import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_api/api%20integration/model/weatherModel.dart';
import 'package:weather_api/constants/apiConstants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_api/main.dart';
class weatherClass {
  Future<WeatherModel?> fetchWeather(var searchText,context) async {
    var url = baseUrl + 'q=$searchText';
    Response response = await get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);
      WeatherModel result = WeatherModel.fromJson(jsonBody);
      return result;
    }
    else if(response.statusCode==400){
      Fluttertoast.showToast(msg: 'Location Not Found !');
    }
    else{
      Fluttertoast.showToast(msg: response.reasonPhrase.toString());
    }
    
    } catch (e) {
      
    }
  }
}
