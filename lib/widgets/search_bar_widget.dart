/*
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchIcon = "assets/icons/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  // Handle the search logic here, e.g., navigate to a search results page
                  print("Searching for: $value"); // Replace this with actual search logic
                }
              },
              decoration: InputDecoration(
                hintText: 'Search products',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600], // Softer grey color for placeholder
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400, // Slightly bolder for user input
                color: Colors.black87, // Dark color for better readability
              ),
            ),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(
            searchIcon,
          ),
        ],
      ),
    );
  }
}


 */
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/search_grocery_item_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchIcon = "assets/icons/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  final results = searchGroceryItems(value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultsScreen(results),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                hintText: 'Search products',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(searchIcon),
        ],
      ),
    );
  }
}

 */
/////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/search_grocery_item_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchIcon = "assets/icons/search_icon.svg";
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) {
                _performSearch(context, value);
              },
              decoration: InputDecoration(
                hintText: 'Search products',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              final value = _searchController.text;
              if (value.isNotEmpty) {
                _performSearch(context, value);
              }
            },
            child: SvgPicture.asset(searchIcon),
          ),
        ],
      ),
    );
  }

  void _performSearch(BuildContext context, String query) {
    final results = searchGroceryItems(query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(results),
      ),
    );
  }
}
