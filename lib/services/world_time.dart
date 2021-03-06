import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the ui
  String time;  // time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoints
  bool isDaytime; // true or false if daytime or not
 WorldTime({this.location,this.flag,this.url});


 Future<void> getTime() async{
 try{
   Response response=await get('http://worldtimeapi.org/api/timezone/$url');
   Map data=jsonDecode(response.body);
   //print(data);

   //get properties from data
   String datetime=data['datetime'];
   String offsethour=data['utc_offset'].substring(1,3);

   String offsetmin=data['utc_offset'].substring(4,6);

   //Create datetime object
   DateTime now=DateTime.parse(datetime);
   now= now.add(Duration(hours:int.parse(offsethour)));
   now= now.add(Duration(minutes:int.parse(offsetmin)));
   isDaytime=now.hour>=6&&now.hour<20?true:false;
  time=DateFormat.jm().format(now);


 }
 catch(e){
//   print(e);
   time="Could not get time data";
 }

  }

}


