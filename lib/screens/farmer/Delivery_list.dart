import 'package:flutter/material.dart';

class DeliveryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery List")),
      body: Center(child: Text("All success deliveries shown here")),
    );
  }
}