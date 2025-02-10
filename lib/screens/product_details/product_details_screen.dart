
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/item_counter_widget.dart';

import 'favourite_toggle_icon_widget.dart';
import 'items_description.dart';
import 'sellers.dart';

// Define a global cart list for simplicity (recommended to use a state management approach for larger apps)
List<GroceryItem> cartItems = [];
class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;
  final String? heroSuffix;
  const ProductDetailsScreen(this.groceryItem, {this.heroSuffix});
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;
  late double negotiatedPrice;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    negotiatedPrice = widget.groceryItem.price;
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.groceryItem.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: AppText(
                        text: widget.groceryItem.description,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C7C7C),
                      ),
                      trailing: FavoriteToggleIcon(),
                    ),
                    //Spacer(),
                    // ye yha se hta diye kyuki , hum sidha se cart se quantity add/less krenege

                    Row(
                      children: [
                        ItemCounterWidget(
                          onAmountChanged: (newAmount) {
                            setState(() {
                              amount = newAmount;
                            });
                          },
                        ),
                        Spacer(),
                        Text(
                          "\₹${getTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    // Spacer(),
                    Divider(thickness: 1),
                    getProductDataRowWidget("Farmer/Sellers"),

                    Divider(thickness: 1),
                    getProductDataRowWidget("Item description"),


                    /*
                    Divider(thickness: 1),
                    getProductDataRowWidget("पोषण",
                        customWidget: nutritionWidget()),

                     */
                    /*
                    Divider(thickness: 1),
                    getProductDataRowWidget(
                      "समीक्षा",
                      customWidget: ratingWidget(),
                    ),

                     */
                    Spacer(),
                    Spacer(),
                    AppButton(
                      label: "नेगोशिएट प्राइस",
                      onPressed: () => showNegotiationDialog(context),
                    ),
                    Divider(thickness: 1),
                    AppButton(
                      label: "टोकरी में जोड़ें",
                      onPressed: () {
                        addToCart();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart() {
    GroceryItem? existingItem;
    try {
      // Try to find the item in the cart
      existingItem =
          cartItems.firstWhere((item) => item.name == widget.groceryItem.name);
    } catch (e) {
      // If not found, `existingItem` will remain null
      existingItem = null;
    }
    if (existingItem != null) {
      // Update quantity if item already in the cart
      setState(() {
        existingItem?.quantity += amount;
      });
    } else {
      // Add a new item to the cart
      setState(() {
        widget.groceryItem.quantity = amount;
        cartItems.add(widget.groceryItem);
      });
    }
    // Show a Snackbar or Toast message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("${widget.groceryItem.name} टोकरी में जोड़ा गया!")),
    );
  }

  Widget getImageHeaderWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF).withOpacity(0.1),
                  const Color(0xFF3366FF).withOpacity(0.09),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Hero(
            tag: "GroceryItem:" +
                widget.groceryItem.name +
                "-" +
                (widget.heroSuffix ?? ""),
            child: Image(
              image: AssetImage(widget.groceryItem.imagePath),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop(); // Close the screen
            },
          ),
        ),
      ],
    );
  }
  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return GestureDetector(
      onTap: () {
        if (label == "Farmer/Sellers") {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SellersPage()),
          );
        } else if (label == "Item description") {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ItemsDescriptionPage()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
            Spacer(),
            if (customWidget != null) ...[
              customWidget,
              SizedBox(width: 20),
            ],
            if (label == "Farmer/Sellers") ...[
              Text(
                "Other",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 1), // Spacing between "Other" and the icon
            ],
            Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
  /*
  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return GestureDetector(
      onTap: () {
        if (label == "Farmer/Sellers") {
          // Navigate to the Farmer/Sellers page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SellersPage()),
          );
        } else if (label == "Item description") {
          // Navigate to the Item Description page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ItemsDescriptionPage()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
            Spacer(),
            if (customWidget != null) ...[
              customWidget,
              SizedBox(width: 20),
            ],
            Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }

   */
/*
  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          Spacer(),
          if (customWidget != null) ...[
            customWidget,
            SizedBox(
              width: 20,
            )
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

 */

/*
  Widget nutritionWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: AppText(
        text: "100 ग्राम",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

 */
/*
  Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }
    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }
 */

  /* double getTotalPrice() {
    return amount * widget.groceryItem.price;
  }
}

  */
  double getTotalPrice() {
    return amount * negotiatedPrice;
  }

  void showNegotiationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 50, // Set the top position to 50
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1, // Center horizontally
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1, // Center horizontally
              child: Material(
                color: Colors.transparent,
                child: Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Negotiate Price", style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Current Quantity: $amount"),
                        Text("Total Price: ₹${getTotalPrice().toStringAsFixed(
                            2)}"),
                        SizedBox(height: 10),
                        TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter your price"),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text("Submit"),
                              onPressed: () {
                                setState(() {
                                  double proposedPrice = double.tryParse(
                                      _priceController.text) ??
                                      widget.groceryItem.price;
                                  negotiatedPrice =
                                  proposedPrice < widget.groceryItem.price
                                      ? proposedPrice
                                      : widget.groceryItem.price;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

