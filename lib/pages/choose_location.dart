import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({Key? key}) : super(key: key);

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTIme> location=[
    WorldTIme(url: 'Asia/Kathmandu', location: 'Kathamandu', flag: 'nepal.png'),
    WorldTIme(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTIme(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTIme(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTIme(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTIme(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTIme(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTIme(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime(index) async{
    WorldTIme instance=location[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime': instance.isdaytime,
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation:0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.5,horizontal: 4.0),
            child: Card(
            child: ListTile(
            onTap: (){
             updatetime(index);
            },

title: Text(
    location[index].location,
  style: TextStyle(
    fontSize: 18,
    letterSpacing: 2,
  ),
),

                tileColor: Colors.grey[200],
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('tasbir/${location[index].flag}'),
              )



            ),
            ),
          );


        }
      ),
    );
  }
}
