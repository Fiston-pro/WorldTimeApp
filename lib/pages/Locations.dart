import 'package:flutter/material.dart';
import 'package:worldtimeapp/helper/Location.dart';


class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  List<Location> locations = [
    Location(url: 'Europe/London'),
    Location(url: 'Africa/Cairo'),
    Location(url: 'America/Chicago'),
    Location(url: 'Asia/Singapore'),
    Location(url: 'Europe/Brussels'),
    
    Location(url: 'Europe/London'),
    Location(url: 'Africa/Cairo'),
    Location(url: 'America/Chicago'),
    Location(url: 'Asia/Singapore'),
    Location(url: 'Europe/Brussels')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,centerTitle: true,
        title: Text('Choose any Location'),
      ),
      body:SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return  Card(child: ListTile(
                  onTap: () async {
                    Location instance = Location(
                    url: locations[index].url);
                    
                    await instance.getTime();
                    print('${instance.location}');
                    Navigator.pop(context,{
                      'location': instance.location,
                      'time': instance.time,
                      'isDaytime': instance.isDaytime
                    });
                  },
                  title: Text('${locations[index].location}', style: TextStyle(fontSize:17),)));
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          )
      )
    );
  }
}
