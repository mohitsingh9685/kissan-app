import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final Function(IconData) onSelectPayment;

  PaymentPage({required this.onSelectPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'भुगतान',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentOption(
              icon: Icons.credit_card,
              text: 'कार्ड द्वारा भुगतान',
              onTap: () {
                onSelectPayment(Icons.credit_card); // Update icon in CheckoutBottomSheet
                Navigator.pop(context);
              },
            ),
            getDivider(),
            paymentOption(
              icon: Icons.account_balance,
              text: 'नेट बैंकिंग',
              onTap: () {
                onSelectPayment(Icons.account_balance); // Update icon in CheckoutBottomSheet
                Navigator.pop(context);
              },
            ),
            getDivider(),
            paymentOption(
              icon: Icons.phone_android,
              text: 'UPI से भुगतान',
              onTap: () {
                onSelectPayment(Icons.phone_android); // Update icon in CheckoutBottomSheet
                Navigator.pop(context);
              },
            ),
            getDivider(),
            paymentOption(
              icon: Icons.attach_money,
              text: 'कैश ऑन डिलीवरी',
              onTap: () {
                onSelectPayment(Icons.attach_money); // Update icon in CheckoutBottomSheet
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentOption({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54, size: 30), // Accent color and larger icon size
      title: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey), // Indicating clickable item
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    );
  }

  Widget getDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey.shade300,
      indent: 8,
      endIndent: 8,
    );
  }
}
