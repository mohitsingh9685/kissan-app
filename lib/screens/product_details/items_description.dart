import 'package:flutter/material.dart';

class ItemsDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Description")),
      body: Center(child: Text("Seasonal, organic")),
    );
  }
}