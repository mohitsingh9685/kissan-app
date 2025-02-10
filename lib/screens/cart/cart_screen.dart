/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/chart_item_widget.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "मेरा कार्ट",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: cartItems.map((item) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: double.maxFinite,
                    child: ChartItemWidget(
                      item: item,
                    ),
                  );
                }).toList(),
              ),


             /*
              Column(
                children: getChildrenWithSeperator(
                  addToLastChild: false,
                  widgets: demoItems.map((e) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      width: double.maxFinite,
                      child: ChartItemWidget(
                        item: e,
                      ),
                    );
                  }).toList(),
                  seperator: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
              ),

              */
              Divider(
                thickness: 1,
              ),
              getCheckoutButton(context)
            ],
          ),
        ),
      ),
    );
  }
  // Method to calculate the total price of all items in the cart
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
     //   color: Colors.blue, //Set your desired color here
      //  textColor: Colors.white,  // set your desired color
      ),
    );
  }

  // Updated to display the total price dynamically
  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice(); // Get the total price
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}", // Display the total price in Rupees
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  /*
  Widget getButtonPriceWidget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color:Colors.white,
       // color: Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹12.96",  // Updated to Rupees
        style: TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.w600),
      ),
    );
  }

   */

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}

 */
//////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/models/grocery_item.dart';
//import 'package:grocery_app/widgets/cart_item_widget.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Method to calculate the total price of all items in the cart
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Method to remove an item from the cart and update the UI
  void removeItem(GroceryItem item) {
    setState(() {
      cartItems.remove(item); // Remove item from the cart list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "मेरा कार्ट",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                children: cartItems.map((item) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: double.maxFinite,
                    child: CartItemWidget(
                      item: item,
                      onRemove: () => removeItem(item), // Pass remove function
                    ),
                  );
                }).toList(),
              ),

              Divider(
                thickness: 1,
              ),
              getCheckoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice(); // Get the updated total price
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}", // Display the total price in Rupees
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}
// cart_item_widget.dart

class CartItemWidget extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onRemove; // New callback for removing the item

  CartItemWidget({required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(item.imagePath, height: 50, width: 50),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name),
            Text("${item.quantity} pcs"),
          ],
        ),
        Spacer(),
        Text("₹${item.price.toStringAsFixed(2)}"),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: onRemove, // Call remove function on press
        ),
      ],
    );
  }
}

 */


/////////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/models/grocery_item.dart';
//import 'package:grocery_app/widgets/cart_item_widget.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
 // Method to calculate the total price of all items in the cart
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Method to remove an item from the cart and update the UI
  void removeItem(GroceryItem item) {
    setState(() {
      cartItems.remove(item); // Remove item from the cart list
    });
  }
  // Method to increase the quantity of an item
  void increaseQuantity(GroceryItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  // Method to decrease the quantity of an item
  void decreaseQuantity(GroceryItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "मेरा कार्ट",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                children: cartItems.map((item) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: double.maxFinite,
                    child: CartItemWidget(
                      item: item,
                      onRemove: () => removeItem(item),
                      onIncrease: () => increaseQuantity(item), // Pass increase function
                      onDecrease: () => decreaseQuantity(item), // Pass decrease function
                    ),
                  );
                }).toList(),
              ),
              Divider(thickness: 1),
              getCheckoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice(); // Get the updated total price
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}", // Display the total price in Rupees
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet();
      },
    );
  }
}



class CartItemWidget extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease; // Callback for increasing quantity
  final VoidCallback onDecrease; // Callback for decreasing quantity

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              item.imagePath,
              height: 80,
              width: 80,
             // fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("${item.quantity} pcs", style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 5),
                  Text(
                    "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],  // Consistent button background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: onDecrease,
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],  // Consistent button background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: onIncrease,
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}

 */

//////////////////////////////////////////////////////////// below code is last uptpdated
/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/models/grocery_item.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void removeItem(GroceryItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void increaseQuantity(GroceryItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  void decreaseQuantity(GroceryItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "मेरा कार्ट",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                children: cartItems.map((item) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CartItemWidget(
                      item: item,
                      onRemove: () => removeItem(item),
                      onIncrease: () => increaseQuantity(item),
                      onDecrease: () => decreaseQuantity(item),
                    ),
                  );
                }).toList(),
              ),
              Divider(thickness: 1),
              getCheckoutButton(context),
            ],
          ),
        ),
      ),
    );
  }
  Container getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं            ",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          if (cartItems.isEmpty) {
            // Show alert if cart is empty
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Cart is empty")),
            );
          } else {
            // Show bottom sheet if cart is not empty
            showBottomSheet(context);
          }
        },
      ),
    );
  }
/*
  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

 */

  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice();
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    double totalPrice = calculateTotalPrice(); // Get the calculated total price
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet(
            totalPrice: totalPrice); // Pass totalPrice here
      },
    );
  }
}
/*
  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet();
      },
    );
  }
}
*/

class CartItemWidget extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for image
                  child: Image.asset(
                    item.imagePath,
                    height: 60,
                    width: 80,
                  //  fit: BoxFit.cover,
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: onDecrease,  // Trigger the action when tapped
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 20,  // Adjust size if needed
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: onIncrease,  // Trigger the action when tapped
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,  // Adjust size if needed
                          ),
                        ),
                      ),
                    ),
                    /* Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: onIncrease,
              ),
            ),
              */
                  ],
                ),
              ],
            ),
            SizedBox(width: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${item.quantity} ${item.unit}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                 /* Text(
                    "${item.quantity} pcs",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),

                  */
                  SizedBox(height: 5),
                  Text(
                    "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),

      ],
    );
  }
}


 */
/////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/models/grocery_item.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void removeItem(GroceryItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void increaseQuantity(GroceryItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  void decreaseQuantity(GroceryItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100), // Add padding to avoid overlapping with button
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Text(
                    "मेरा कार्ट",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: cartItems.map((item) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: CartItemWidget(
                          item: item,
                          onRemove: () => removeItem(item),
                          onIncrease: () => increaseQuantity(item),
                          onDecrease: () => decreaseQuantity(item),
                        ),
                      );
                    }).toList(),
                  ),
                  Divider(thickness: 1),
                ],
              ),
            ),
            Positioned(
              bottom: 20, // Distance from bottom of screen
              left: 25,
              right: 25,
              child: getCheckoutButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Container getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "चेकआउट पर जाएं           ",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          if (cartItems.isEmpty) {
            // Show alert if cart is empty
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Cart is empty")),
            );
          } else {
            // Show bottom sheet if cart is not empty
            showBottomSheet(context);
          }
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice();
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    double totalPrice = calculateTotalPrice(); // Get the calculated total price
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet(
            totalPrice: totalPrice); // Pass totalPrice here
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.imagePath,
                    height: 60,
                    width: 80,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: onIncrease,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${item.quantity} ${item.unit}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}


 */
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/models/grocery_item.dart';

import '../product_details/product_details_screen.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void removeItem(GroceryItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void increaseQuantity(GroceryItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  void decreaseQuantity(GroceryItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: DraggableScrollableSheet(
                initialChildSize: 0.99,
                minChildSize: 0.98,
                maxChildSize: 1.0,
                builder: (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.only(bottom: 100), // Avoids overlap
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Text(
                          "मेरा कार्ट",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: cartItems.map((item) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300, width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 6,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: CartItemWidget(
                                item: item,
                                onRemove: () => removeItem(item),
                                onIncrease: () => increaseQuantity(item),
                                onDecrease: () => decreaseQuantity(item),
                              ),
                            );
                          }).toList(),
                        ),
                        Divider(thickness: 1),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20, // Distance from the bottom of the screen
              left: 25,
              right: 25,
              child: getCheckoutButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Container getCheckoutButton(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the button full-width
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Adjust padding
      child: AppButton(
        label: "चेकआउट पर जाएं                 ",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          if (cartItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Cart is empty")),
            );
          } else {
            showBottomSheet(context);
          }
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    double totalPrice = calculateTotalPrice();
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "₹${totalPrice.toStringAsFixed(2)}",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    double totalPrice = calculateTotalPrice();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet(totalPrice: totalPrice);
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.imagePath,
                    height: 60,
                    width: 80,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: onIncrease,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${item.quantity} ${item.unit}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ],
    );
  }
}
