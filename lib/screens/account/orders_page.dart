import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Center(
        child: Text(
          "No orders",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}