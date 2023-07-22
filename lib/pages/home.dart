import 'package:flutter/material.dart';
import 'package:wold_time_app/pages/menu/appDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    // Update data map with values from arguments, if available
    if (args != null && args is Map) {
      data['time'] = args['time'];
      data['location'] = args['location'];
      data['isDaytime'] = args['isDaytime'];
      data['flag'] = args['flag'];
    }

    print(data);

    // set background
    String bgImage = data['isDaytime'] == true ? 'day.png' : 'night.png';

    Color bgColor = data['isDaytime'] == true
        ? Colors.blue
        : Colors.indigo[700] ?? Colors.blue;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'World Time App',
                style: TextStyle(color: Colors.blue),
              ),
              centerTitle: true,
              elevation: 5.0,
              expandedHeight: 50.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 30.0,
                  child: Image.asset(
                    'assets/product-time.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
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
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data['flag']}'),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');

                        if (result != null && result is Map) {
                          setState(() {
                            data['location'] = result['location'];
                            data['flag'] = result['flag'];
                            data['time'] = result['time'];
                            data['isDaytime'] = result['isDaytime'];
                          });
                        }
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
                          data['location'] ?? '',
                          style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['time'] ?? '',
                      style: TextStyle(fontSize: 66.9, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
