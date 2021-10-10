import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Location{

  String location;
  late String time;
  String url;
  late bool isDaytime;
  //String flag;

  Location({required this.location,required this.url});

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
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
    } catch(e){
      print('Caught an error: $e');
    }
    
  }


}