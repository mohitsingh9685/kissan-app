import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text(
          "Happpppppy Diwali",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}