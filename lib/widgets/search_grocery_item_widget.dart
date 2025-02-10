/*
import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<GroceryItem> results;

  SearchResultsScreen(this.results);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return ListTile(
            leading: Image.asset(item.imagePath),
            title: Text(item.name),
            subtitle: Text("${item.description} - ₹${item.price}"),
          );
        },
      ),
    );
  }
}

 */
import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/product_details/product_details_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<GroceryItem> results;

  SearchResultsScreen(this.results);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return ListTile(
            leading: Image.asset(item.imagePath),
            title: Text(item.name),
            subtitle: Text("${item.description} - ₹${item.price}"),
            onTap: () {
              // Navigate to ProductDetailsScreen when the item is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

