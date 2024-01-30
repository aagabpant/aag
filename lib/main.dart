
import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loadind.dart.';
import 'pages/home.dart';
import 'package:http/http.dart';
void main() => runApp( MaterialApp(
    initialRoute: '/',
    routes: {
        '/':(context) =>Loading(),
        '/home':(context) =>Home(),
        '/Location':(context)=>Chooselocation(),

    },
));


