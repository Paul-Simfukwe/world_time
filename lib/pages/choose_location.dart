import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url:'Africa/Lusaka', location:'Lusaka', flag:'zambia.jpg'),
    WorldTime(url:'Africa/Nairobi', location:'Nairobi', flag:'kenya.jpg'),
    WorldTime(url:'Africa/Kigali', location:'Kigali', flag:'rwanda.jpg'),
    WorldTime(url:'America/New_York', location:'New_York', flag:'us.jpg'),
    WorldTime(url:'America/Chicago', location:'Chicago', flag:'us.jpg'),
    WorldTime(url:'Europe/London', location:'London', flag:'uk.jpg'),
    WorldTime(url:'Europe/Amsterdam', location:'Amsterdam', flag:'uk.jpg'),
    WorldTime(url:'Asia/Calcutta', location:'Calcutta', flag:'india.jpg'),
    WorldTime(url:'Asia/Hong_Kong', location:'Hong_Kong', flag:'china.jpg'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location), // Wrap the location in Text widget
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
