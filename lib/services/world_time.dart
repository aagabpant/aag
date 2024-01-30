import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldTIme {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isdaytime; //true or false a variable


  WorldTIme({required this.location, required this.flag, required this.url});

   Future <void> getTime() async
  {
    try {
      //make the response
      var ural = Uri.parse('https://www.worldtimeapi.org/api/timezone/$url');
      var response = await http.get(ural);
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1, 3);
      String minu = data['utc_offset'].substring(4, 6);
      //print(datetime);
      //print(minu);

//create DateTIme object
      //DateTIme is a keyword (now) is a object
      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(utc_offset), minutes: int.parse(minu)));
      isdaytime= now.hour > 6 && now.hour<18? true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time='could not get time';
    }

  }
}
