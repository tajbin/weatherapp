import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


class Worker {
  String location;
  String? temp;
  String? humidity;
  String? airSpeed;
  String? main;
  String? desc;

  Worker({required this.location}) {
    location=this.location;
  }



  Future<void> getData() async {
    Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=bec0239b2ed8d13242fb283afc71e8f9"));
    Map data = jsonDecode(response.body);

   //error handaling
    try{
      // getting temp, humidity
      Map temp_data = data["main"];
      double getTemp = (temp_data["temp"] as num).toDouble()-273.15; // Convert to double
      String getHumidity = (temp_data["humidity"] as num).toString(); // Convert to double

      // getting main, description
      List weather_data = data["weather"];
      Map weather_main_data = weather_data[0];
      String getMain = weather_main_data["main"] as String; // Ensure it's a String
      String getDesc = weather_main_data["description"] as String; // Ensure it's a String

      // getting airspeed
      Map wind_data = data["wind"];
      double getAirSpeed = (wind_data["speed"] as num).toDouble()/0.27777777778; // Convert to double
      //assignining value
      temp = getTemp.toString(); //C
      humidity = getHumidity;    //%
      airSpeed = getAirSpeed.toString(); //km/hr
      desc = getDesc;
      main = getMain;

    }catch(e){
      temp = "No City Found";
      humidity = "No City Found";
      airSpeed = "No City Found";
      desc = "No City Found";
      main = "No City Found";
    }
  }



}
