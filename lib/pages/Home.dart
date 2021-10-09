import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

   final data = ModalRoute.of(context)!.settings.arguments as Map;

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
                  FlatButton.icon(onPressed: (){

                  }, icon: Icon(Icons.edit_location), label: Text('other locations', style: TextStyle(fontSize: 20),)),
                  SizedBox(height: 50,),
                  Text('${data['location']}',style: TextStyle(fontSize: 30, letterSpacing: 2.0)),
                  SizedBox(height: 16,),
                  Text('${data['time']}',style: TextStyle(fontSize: 50,letterSpacing: 2, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
