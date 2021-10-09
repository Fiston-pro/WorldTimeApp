import 'dart:convert';
import 'package:http/http.dart';

class Location{

  String location;
  late String time;
  String url;
  //String flag;

  Location({required this.location,required this.url});

  Future<void> getTime() async {

    try{

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/$url'));
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map data = jsonDecode(response.body);
        String utc = data['utc_offset'].substring(1,3);

        //making a datetime object
        DateTime now = DateTime.parse(data['datetime']);
        now =  now.add(Duration(hours: int.parse(utc)));
        time = now.toString();
    } catch(e){
      print('Caught an error: $e');
    }
    
  }


}