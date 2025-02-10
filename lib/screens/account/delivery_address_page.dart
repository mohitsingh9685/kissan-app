import 'package:flutter/material.dart';

class DeliveryAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Address"),
      ),
      body: Center(
        child: Text(
          "This is the Delivery Address Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}