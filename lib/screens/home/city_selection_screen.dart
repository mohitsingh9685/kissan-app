// city_selection.dart
/*
import 'package:flutter/material.dart';

class CitySelectionScreen extends StatelessWidget {
  final List<String> cities = [
    "Agra",
    "Aligarh",
    "Amritsar",
    "Bareilly",
    "Chandigarh",
    "Dehradun",
    "Faridabad",
    "Ghaziabad",
    "Gorakhpur",
    "Gurugram",
    "Haridwar",
    "Jaipur",
    "Jalandhar",
    "Jammu",
    "Jhansi",
    "Jodhpur",
    "Kanpur",
    "Kurukshetra",
    "Ludhiana",
    "Meerut",
    "Moradabad",
    "New Delhi",
    "Noida",
    "Panipat",
    "Patiala",
    "Prayagraj",
    "Rishikesh",
    "Rohtak",
    "Shimla",
    "Srinagar",
    "Varanasi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.pop(context, cities[index]); // Return the selected city
            },
          );
        },
      ),
    );
  }
}

 */


import 'package:flutter/material.dart';

class CitySelectionScreen extends StatelessWidget {
  final List<String> cities;

  CitySelectionScreen({required this.cities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.pop(context, cities[index]); // Return selected city
            },
          );
        },
      ),
    );
  }
}
