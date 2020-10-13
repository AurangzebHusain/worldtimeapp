import 'package:flutter/material.dart';
import 'package:timerapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timerapp/pages/choose_location.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
  WorldTime instance= WorldTime(location:'Kolkata',flag:'india.png',url:'Asia/Kolkata');
  await instance.getTime();
  Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location':instance.location,
    'flag':instance.flag,
  'time':instance.time,
  'isDaytime':instance.isDaytime});
//  print(instance.time);

}

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitFoldingCube(
          color: Colors.lightBlue,
          size: 150.0,
        ),
      )
    );
  }
}
