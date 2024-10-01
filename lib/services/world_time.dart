import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String time = ''; // Time to display, initialize as an empty string
  String flag; // URL to an asset flag icon
  String url;// Location URL for the API endpoint
  bool? isDaytime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  // Change the return type to Future<void>
  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
