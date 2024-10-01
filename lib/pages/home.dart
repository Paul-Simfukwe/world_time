import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Safely retrieve arguments from the route
    final routeData = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;

    if (routeData != null) {
      data = routeData;  // Assign routeData to data if not null
    }

    print(data);  // Check the data being passed

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;


    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 140.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                 dynamic  result  = await Navigator.pushNamed(context, '/location');
                 setState(() {
                   data ={
                     'time': result['time'],
                     'location': result['location'],
                     'isDaytime': result['isDaytime'],
                     'flag': result['flag'],
                   };
                 });
                  },
                  child: Row( // Wrap Icon and Text in a Row,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          Icons.edit_location,
                          color: Colors.grey,
                      ),
                      SizedBox(width: 8.0), // Add spacing between icon and text
                      Text('Edit Location'),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
