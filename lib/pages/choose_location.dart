import 'package:flutter/material.dart';
import 'package:wold_time_app/service/world_time.dart';

class choose_location extends StatefulWidget {
  const choose_location({super.key});

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  List<WorldTime> locatoins = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_Yourk', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Vientiane', location: 'Vientaine', flag: 'lao.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locatoins[index];
    await instance.getTime(); //Navigate to home screen
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
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Choose location"),
          centerTitle: true,
          elevation: 5.0,
        ),
        body: ListView.builder(
          itemCount: locatoins.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    // print(locatoins[index].location);
                  },
                  title: Text(locatoins[index].location ?? ''),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locatoins[index].flag ?? ''}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
