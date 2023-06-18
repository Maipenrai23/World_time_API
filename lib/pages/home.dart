import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map) {
      data = args;
      print(data);
    }

    print(data);

    // set background
    String bgImage = data['IsDayTime'] ?? false ? 'day.png' : 'night.png';

    Color bgColor = data['isDaytime'] == true
        ? Colors.blue
        : Colors.indigo[700] ?? Colors.blue;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  // Navigator.pushNamed(context, '/location')
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                label: Text(
                  'Edit location',
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // 'Text data'
                    data['location'] ?? 'Unknow',
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                // 'Text data'
                data['time'] ?? 'Unknow',
                style: TextStyle(fontSize: 66.9, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
