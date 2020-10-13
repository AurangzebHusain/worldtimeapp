import 'package:flutter/material.dart';
import 'package:timerapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List locations=[
    WorldTime(location:'Kolkata',flag:'india.png',url:'Asia/Kolkata'),
    WorldTime(location:'London',flag:'germany.png',url:'Europe/London'),
    WorldTime(location:'Athens',flag:'germany.png',url:'Europe/Berlin'),
    WorldTime(location:'Cairo',flag:'germany.png',url:'Africa/Cairo'),
    WorldTime(location:'Nairobi',flag:'germany.png',url:'Africa/Nairobi'),
    WorldTime(location:'Chicago',flag:'germany.png',url:'America/Chicago'),
    WorldTime(location:'New York',flag:'germany.png',url:'America/New_York'),
    WorldTime(location:'Seoul',flag:'germany.png',url:'Asia/Seoul'),
    WorldTime(location:'Jakarta',flag:'germany.png',url:'Asia/Jakarta'),
    WorldTime(location:'Cocos',flag:'germany.png',url:'Indian/Cocos')
  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime});
  }
  @override
  Widget build(BuildContext context) {
    print("buildstate function ran");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(itemCount:locations.length,
          itemBuilder: (context,index){
        return Card(
          child:ListTile(
            onTap: (){
              updateTime(index);
            },
            title:Text(locations[index].location),
          )
        );
          })
    );
  }
}
