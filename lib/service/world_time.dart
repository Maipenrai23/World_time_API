import 'package:http/http.dart';
// import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? time;
  String? url;
  String? location;
  String? flag;
  bool? isDaytime;

  WorldTime({this.url, this.location, this.flag});
  // WorldTime({this.location, this.flag});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error: $e');
      time = 'Error loading time';
    }
  }
}
