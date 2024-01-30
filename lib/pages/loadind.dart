import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';


class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async
  {
    //from the world_time WorldTime class is retrived
    //instance is just a variable
    WorldTIme instance = WorldTIme(location: 'Berlin', flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime': instance.isdaytime,
    } );


    }


  @override
  void initState() {

    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(

            'PLease Wait',
           style: TextStyle(

             color: Colors.white,
             fontSize: 50,

           ),
          ),
          SizedBox(height: 400),
          Center(
child: SpinKitFadingCircle(
  color: Colors.red,
),
          ),
        ],
      )
    );
  }
}

