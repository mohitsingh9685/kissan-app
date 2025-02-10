import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
      ),
      body: Center(
        child: Text(
          "This is the Payment Methods Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}