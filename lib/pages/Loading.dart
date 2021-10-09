import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/helper/Location.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpTime() async{
    Location instance = Location(location: 'London',url: 'London');
    await instance.getTime();
    Navigator.pushReplacementNamed( context, '/Home', arguments: {
      'location': instance.location,
      'isDayTime': instance.isDaytime,
      'time': instance.time
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:
          SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),),
    );
  }
}
