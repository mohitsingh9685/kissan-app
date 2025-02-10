/*
import 'package:flutter/foundation.dart';
import 'package:grocery_app/models/grocery_item.dart';

class CartProvider with ChangeNotifier {
  final List<GroceryItem> _cartItems = [];

  List<GroceryItem> get cartItems => _cartItems;

  void addItem(GroceryItem item) {
    var existingItem = _cartItems.firstWhere(
          (cartItem) => cartItem.name == item.name,
      orElse: () => null,
    );

    if (existingItem != null) {
      // Update quantity if item already exists
      existingItem.quantity += item.quantity;
    } else {
      // Add new item to the cart
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(GroceryItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}

 */