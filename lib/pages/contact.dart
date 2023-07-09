import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact list"),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Center(
        child: Text(
          "Contact screen",
          style: TextStyle(fontSize: 40.0, color: Colors.blue),
        ),
      ),
    );
  }
}
