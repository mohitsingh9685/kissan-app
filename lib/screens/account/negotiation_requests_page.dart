import 'package:flutter/material.dart';

class NegotiationRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Negotiation Requests"),
      ),
      body: Center(
        child: Text(
          "This is the Negotiation Requests Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}