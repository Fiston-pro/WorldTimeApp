import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String image = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$image"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Align(
              child: Column(
                children: [
                  FlatButton.icon(onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/Locations');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDaytime']
                      };
                    });
                    print('location is: ${result['location']}');
                  }, icon: Icon(Icons.edit_location,color: Colors.grey[300]), label: Text('other locations', style: TextStyle(fontSize: 20,color: Colors.grey[300]),)),
                  SizedBox(height: 50,),
                  Text('${data['location']}',style: TextStyle(fontSize: 30, letterSpacing: 2.0, color: Colors.white)),
                  SizedBox(height: 16,),
                  Text('${data['time']}',style: TextStyle(fontSize: 50,letterSpacing: 2, color: Colors.white, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
