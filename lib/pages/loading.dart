import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<void> setWorldTime() async {
    WorldTime instance = WorldTime(location: 'Lusaka', flag: 'zambia.png', url: 'Africa/Lusaka');
    await instance.getTime();
    print(instance.time);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });


  }

  @override
  void initState() {
    super.initState();
    setWorldTime(); // Call the function when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
