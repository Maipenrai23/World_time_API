import 'package:flutter/material.dart';
import 'package:wold_time_app/pages/home.dart';
import 'package:wold_time_app/pages/choose_location.dart';
import 'package:wold_time_app/pages/loading.dart';
import 'package:wold_time_app/pages/contact.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/home': (context) => Home(),
        '/location': (context) => choose_location(),
        '/contact': (context) => ContactPage(),
      },
      title: 'World Time API',
      theme:
          ThemeData(fontFamily: 'NotoSansLaoLooped', primaryColor: Colors.blue),
      home: Scaffold(),
    ));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',

//       home: Home(), // Replace Container() with your HomeScreen widget
//     );
//   }
// }
