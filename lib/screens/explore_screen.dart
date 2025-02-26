/*
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/category_item.dart';
import 'package:grocery_app/widgets/category_item_card_widget.dart';
import 'package:grocery_app/widgets/search_bar_widget.dart';

import '../models/grocery_item.dart';
import 'category_items_screen.dart';

List<Color> gridColors = [
  Color(0xff53B175),
  Color(0xffF8A44C),
  Color(0xffF7A593),
  Color(0xffD3B0E0),
  Color(0xffFDE598),
  Color(0xffB7DFF5),
  Color(0xff836AF6),
  Color(0xffD73B77),
];

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              getHeader(),
              Expanded(
                child: getStaggeredGridView(context),
              ),
            ],
          ),
        ));
  }

  Widget getHeader() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: AppText(
            text: "उत्पाद खोजें",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarWidget(),
        ),
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
          int index = e.key;
          CategoryItem categoryItem = e.value;
          return GestureDetector(
            onTap: () {
              onCategoryItemClicked(context, categoryItem);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: CategoryItemCardWidget(
                item: categoryItem,
                color: gridColors[index % gridColors.length],
              ),
            ),
          );
        }).toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 4.0, // add some space
      ),
    );
  }
  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    List<GroceryItem> selectedItems;

    switch (categoryItem.id) {
      case 1:
        selectedItems = fruits;
        break;
      case 2:
        selectedItems = veggies;
        break;
      case 3:
        selectedItems = pulses;
        break;
      case 4:
        selectedItems = grains;
        break;
      case 5:
        selectedItems = spices;
        break;
      case 6:
        selectedItems = dairy;
        break;
      default:
        selectedItems = []; // fallback if id is not matched
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryItemsScreen(items: selectedItems),
      ),
    );
  }

 */
  /*
  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryItemsScreen();
      },
    ));
  }
}

   */
  import 'package:flutter/material.dart';
  import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
  import 'package:grocery_app/common_widgets/app_text.dart';
  import 'package:grocery_app/models/category_item.dart';
  import 'package:grocery_app/widgets/category_item_card_widget.dart';
  import 'package:grocery_app/widgets/search_bar_widget.dart';
  import '../models/grocery_item.dart';
  import 'category_items_screen.dart';

  List<Color> gridColors = [
    Color(0xff53B175),
    Color(0xffF8A44C),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xffB7DFF5),
    Color(0xff836AF6),
    Color(0xffD73B77),
  ];
class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    getHeader(),
                    getStaggeredGridView(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: AppText(
            text: "उत्पाद खोजें",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarWidget(),
        ),
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
          int index = e.key;
          CategoryItem categoryItem = e.value;
          return GestureDetector(
            onTap: () => onCategoryItemClicked(context, categoryItem),
            child: Container(
              padding: EdgeInsets.all(10),
              child: CategoryItemCardWidget(
                item: categoryItem,
                color: gridColors[index % gridColors.length],
              ),
            ),
          );
        }).toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    List<GroceryItem> selectedItems;

    switch (categoryItem.id) {
      case 1:
        selectedItems = fruits;
        break;
      case 2:
        selectedItems = veggies;
        break;
      case 3:
        selectedItems = pulses;
        break;
      case 4:
        selectedItems = grains;
        break;
      case 5:
        selectedItems = spices;
        break;
      case 6:
        selectedItems = dairy;
        break;
      default:
        selectedItems = [];
        break;
    }

    if (selectedItems.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CategoryItemsScreen(items: selectedItems),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No items available in this category.")),
      );
    }
  }
}
/*
  class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: SafeArea(
  child: Column(
  children: [
  getHeader(),
  Expanded(
  child: getStaggeredGridView(context),
  ),
  ],
  ),
  ),
  );
  }

  Widget getHeader() {
  return Column(
  children: [
  SizedBox(height: 20),
  Center(
  child: AppText(
  text: "उत्पाद खोजें",
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  ),
  SizedBox(height: 20),
  Padding(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: SearchBarWidget(),
  ),
  ],
  );
  }

  Widget getStaggeredGridView(BuildContext context) {
  return SingleChildScrollView(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: StaggeredGrid.count(
  crossAxisCount: 2,
  children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
  int index = e.key;
  CategoryItem categoryItem = e.value;
  return GestureDetector(
  onTap: () => onCategoryItemClicked(context, categoryItem),
  child: Container(
  padding: EdgeInsets.all(10),
  child: CategoryItemCardWidget(
  item: categoryItem,
  color: gridColors[index % gridColors.length],
  ),
  ),
  );
  }).toList(),
  mainAxisSpacing: 3.0,
  crossAxisSpacing: 4.0,
  ),
  );
  }

  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
  List<GroceryItem> selectedItems;

  // Assuming your category IDs start from 1
  switch (categoryItem.id) {
  case 1:
  selectedItems = fruits;
  break;
  case 2:
  selectedItems = veggies;
  break;
  case 3:
  selectedItems = pulses;
  break;
  case 4:
  selectedItems = grains;
  break;
  case 5:
  selectedItems = spices;
  break;
  case 6:
  selectedItems = dairy;
  break;
  default:
  selectedItems = [];
  break;
  }

  if (selectedItems.isNotEmpty) {
  Navigator.of(context).push(
  MaterialPageRoute(
  builder: (context) => CategoryItemsScreen(items: selectedItems),
  ),
  );
  } else {
  // Optionally, show a message if no items found
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text("No items available in this category.")),
  );
  }
  }
  }

 */