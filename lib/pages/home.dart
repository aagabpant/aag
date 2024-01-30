import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  bool dark=false;

  @override
  Widget build(BuildContext context) {
    data =  data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgimage=data['isdaytime']?'day1.jpg' : 'night.jpg';

    return Scaffold(
      body: Center(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('tasbir/$bgimage'),
              fit: BoxFit.cover,
            )
          ),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  OutlinedButton.icon(
                      onPressed:()async {
                        dynamic result =await Navigator.pushNamed(context, '/Location');
                        setState(() {
                          data={
                            'time':result['time'],
                            'location':result['location'],
                            'flag':result['flag'],
                            'isdaytime':result['isdaytime'],
                          };
                        });
                      },

                    icon: Icon(
                        Icons.edit_location_alt
                    ),
                    label:Text(
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                      'Edit Location',
                    ),

                  ),
                  SizedBox(height: 50),






                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                          data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          color: Colors.red[200],
                        ),

                      ),
                      SizedBox(width: 100.0),



                    ],


                  ),

                  SizedBox(height: 90.0),

                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      letterSpacing: 2,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

      );
  }
}
