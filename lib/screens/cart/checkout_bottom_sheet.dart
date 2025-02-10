/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import '../order_accepted_screen.dart';

class CheckoutBottomSheet extends StatefulWidget {
  final double totalPrice;

  CheckoutBottomSheet({required this.totalPrice});

  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "चेकआउट",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          getDivider(),
          checkoutRow("डिलीवरी", trailingText: "विधि चुनें"),
          getDivider(),
          checkoutRow(
            "भुगतान",
            trailingWidget: const Icon(Icons.payment),
          ),
          getDivider(),
          checkoutRow("प्रोमो कोड", trailingText: "डिस्काउंट चुनें"),
          getDivider(),
          checkoutRow("कुल लागत", trailingText: "₹${widget.totalPrice.toStringAsFixed(2)}"), // Use totalPrice here
          getDivider(),
          const SizedBox(height: 30),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: AppButton(
              label: "ऑर्डर करें",
              padding: const EdgeInsets.symmetric(vertical: 25),
              onPressed: onPlaceOrderClicked,
            ),
          ),
        ],
      ),
    );
  }
/*
class CheckoutBottomSheet extends StatefulWidget {
  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "चेकआउट",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
              
            ],
          ),
          const SizedBox(height: 45),
          getDivider(),
          checkoutRow("डिलीवरी", trailingText: "विधि चुनें"),
          getDivider(),
          checkoutRow(
            "भुगतान",
            trailingWidget: const Icon(Icons.payment),
          ),
          getDivider(),
          checkoutRow("प्रोमो कोड", trailingText: "डिस्काउंट चुनें"),
          getDivider(),
          checkoutRow("कुल लागत", trailingText: "₹13.97"),
          getDivider(),
          const SizedBox(height: 30),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: AppButton(
              label: "ऑर्डर करें",
              padding: const EdgeInsets.symmetric(vertical: 25),
              onPressed: onPlaceOrderClicked,
            ),
          ),
        ],
      ),
    );
  }

 */

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'ऑर्डर करने पर आप हमारी',
        style: TextStyle(
          color: const Color(0xFF7C7C7C),
          fontSize: 14,
          fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
          fontWeight: FontWeight.w600,
        ),
        children: const [
          TextSpan(
            text: " शर्तों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " और"),
          TextSpan(
            text: " नियमों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " से सहमत होते हैं।"),
        ],
      ),
    );
  }

  Widget checkoutRow(String label,
      {String? trailingText, Widget? trailingWidget}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          AppText(
            text: label,
            fontSize: 18,
            color: const Color(0xFF7C7C7C),
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          trailingText == null
              ? (trailingWidget ?? Container())
              : AppText(
            text: trailingText,
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(width: 20),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
     //   return OrderFailedDialogue();
        return  OrderAcceptedScreen();
      },
    );
  }
}

 */
///////////////////////////////////below after , after payment page
/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import '../order_accepted_screen.dart';
import 'payment_page.dart';

class CheckoutBottomSheet extends StatefulWidget {
  final double totalPrice;

  CheckoutBottomSheet({required this.totalPrice});

  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  IconData selectedPaymentIcon = Icons.payment; // Default payment icon

  void updatePaymentIcon(IconData icon) {
    setState(() {
      selectedPaymentIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "चेकआउट",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          getDivider(),
          checkoutRow("डिलीवरी", trailingText: "तारीख़ चुनें"),
          getDivider(),
          checkoutRow(
            "भुगतान",
            trailingWidget: Icon(selectedPaymentIcon),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    onSelectPayment: updatePaymentIcon,
                  ),
                ),
              );
            },
          ),
          getDivider(),
          checkoutRow("प्रोमो कोड", trailingText: "डिस्काउंट चुनें"),
          getDivider(),
          checkoutRow("कुल लागत", trailingText: "₹${widget.totalPrice.toStringAsFixed(2)}"),
          getDivider(),
          const SizedBox(height: 30),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: AppButton(
              label: "ऑर्डर करें",
              padding: const EdgeInsets.symmetric(vertical: 25),
              onPressed: onPlaceOrderClicked,
            ),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'ऑर्डर करने पर आप हमारी',
        style: TextStyle(
          color: const Color(0xFF7C7C7C),
          fontSize: 14,
          fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
          fontWeight: FontWeight.w600,
        ),
        children: const [
          TextSpan(
            text: " शर्तों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " और"),
          TextSpan(
            text: " नियमों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " से सहमत होते हैं।"),
        ],
      ),
    );
  }

  Widget checkoutRow(String label,
      {String? trailingText, Widget? trailingWidget, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            AppText(
              text: label,
              fontSize: 18,
              color: const Color(0xFF7C7C7C),
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            trailingText == null
                ? (trailingWidget ?? Container())
                : AppText(
              text: trailingText,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(width: 20),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderAcceptedScreen();
      },
    );
  }
}

 */
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import '../order_accepted_screen.dart';
import 'payment_page.dart';
import 'delivery_page.dart'; // Import the DeliveryPage
import 'promo_code_page.dart'; // Import the PromoCodePage

class CheckoutBottomSheet extends StatefulWidget {
  final double totalPrice;

  CheckoutBottomSheet({required this.totalPrice});

  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  IconData selectedPaymentIcon = Icons.payment; // Default payment icon

  void updatePaymentIcon(IconData icon) {
    setState(() {
      selectedPaymentIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "चेकआउट",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          getDivider(),
          // Inside the checkoutRow for "डिलीवरी"
          checkoutRow("डिलीवरी", trailingText: "तारीख़ चुनें", onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryPage()),
            );
            if (result != null) {
              String date = result['date'].toString();
              String timeSlot = result['timeSlot'];
              // Update your UI or state with the selected date and time slot
              // For example, show it in the trailingText or save it for later use
              setState(() {
                // Update the UI with selected date and time slot
              });
            }
          }),
          /*
          checkoutRow("डिलीवरी", trailingText: "तारीख़ चुनें", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryPage()),
            );
          }),

           */
          getDivider(),
          checkoutRow(
            "भुगतान",
            trailingWidget: Icon(selectedPaymentIcon),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    onSelectPayment: updatePaymentIcon,
                  ),
                ),
              );
            },
          ),
          getDivider(),
          checkoutRow("प्रोमो कोड", trailingText: "डिस्काउंट चुनें", onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PromoCodePage()),
            );

            if (result != null) {
              // Handle the result if necessary
              // For example, you may want to display the applied promo code or any other related data.
            }
          }),
          /*
          checkoutRow("प्रोमो कोड", trailingText: "डिस्काउंट चुनें", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PromoCodePage()),
            );
          }),

           */
          getDivider(),
          checkoutRow("कुल लागत", trailingText: "₹${widget.totalPrice.toStringAsFixed(2)}"),
          getDivider(),
          const SizedBox(height: 30),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: AppButton(
              label: "ऑर्डर करें",
              padding: const EdgeInsets.symmetric(vertical: 25),
              onPressed: onPlaceOrderClicked,
            ),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'ऑर्डर करने पर आप हमारी',
        style: TextStyle(
          color: const Color(0xFF7C7C7C),
          fontSize: 14,
          fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
          fontWeight: FontWeight.w600,
        ),
        children: const [
          TextSpan(
            text: " शर्तों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " और"),
          TextSpan(
            text: " नियमों",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: " से सहमत होते हैं।"),
        ],
      ),
    );
  }

  Widget checkoutRow(String label,
      {String? trailingText, Widget? trailingWidget, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            AppText(
              text: label,
              fontSize: 18,
              color: const Color(0xFF7C7C7C),
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            trailingText == null
                ? (trailingWidget ?? Container())
                : AppText(
              text: trailingText,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(width: 20),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderAcceptedScreen();
      },
    );
  }
}