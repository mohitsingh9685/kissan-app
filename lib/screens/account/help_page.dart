import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Center(
        child: Text(
          "This is the Help Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}