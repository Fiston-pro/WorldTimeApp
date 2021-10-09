import 'package:flutter/material.dart';
import 'package:worldtimeapp/helper/Location.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setUpTime() async{
    Location instance = Location(location: 'London',url: 'London');
    await instance.getTime();
    setState(() {
      time = instance.time;
      print('time');
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
      body: Text('$time'),
    );
  }
}
