import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
      ),
      body: Center(
        child: Text(
          "This is the Personal Info Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}