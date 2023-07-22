import 'package:http/http.dart';
// import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint
  bool? isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      List<String> offsetParts = offset.split(':');
      int offsetHours = int.parse(offsetParts[0]);
      int offsetMinutes = int.parse(offsetParts[1]);
      Duration offsetDuration =
          Duration(hours: offsetHours, minutes: offsetMinutes);

// create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(offsetDuration);

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20;
      // time = DateFormat.jm().format(now);
      time = DateFormat('h:mm a').format(now);
    } catch (e) {
      print('Error: $e');
      time = 'Could not get time data';
    }
  }
}
