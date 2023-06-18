import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? time;
  String? url;
  String? location;
  String? flag;
  bool? isDaytime;

  WorldTime({this.url, this.location, this.flag});

  Future<void> getTime() async {
    try {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      SecurityContext context = SecurityContext.defaultContext;
      // make the request
      final response = await client
          .getUrl(
              Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Vientiane'))
          .then((HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        return response.transform(utf8.decoder).join('');
      }).then((body) => json.decode(body));

      // get properties from data
      String datetime = response['datetime'];
      String offset = response['utc_offset'].substring(1, 3);
      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Cant get datetime';
    }
  }
}
