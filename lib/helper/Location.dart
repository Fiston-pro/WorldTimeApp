import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Location{

  late String location;
  late String time;
  String url;
  late bool isDaytime;
  //String flag;

  Location({required this.url}){
    
        List dummy = url.split('/');
        location = dummy[1].toString();
  }

  Future<void> getTime() async {

    try{

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map data = jsonDecode(response.body);
        String utc = data['utc_offset'].substring(1,3);

        //making a datetime object
        DateTime now = DateTime.parse(data['datetime']);
        now =  now.add(Duration(hours: int.parse(utc)));

        // check which time of the day is morning or night
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

        // Keep the current time from an api
        time = DateFormat.jm().format(now);

        // keep the location

    } catch(e){
      print('Caught error: $e');
    }
    
  }


}
