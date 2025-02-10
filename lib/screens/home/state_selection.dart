

import 'package:flutter/material.dart';
import 'city_selection_screen.dart';
import 'city_selection_screen.dart';

class StateSelectionScreen extends StatelessWidget {
  final Map<String, List<String>> stateCities = {
    "Delhi": ["New Delhi", "Dwarka", "Rohini"],
    "Haryana": ["Gurugram", "Faridabad", "Panipat", "Rohtak"],
    "Punjab": ["Amritsar", "Ludhiana", "Patiala", "Jalandhar"],
    "Uttar Pradesh": ["Agra", "Kanpur", "Lucknow", "Varanasi", "Noida"],
    "Rajasthan": ["Jaipur", "Jodhpur", "Udaipur", "Kota"],
    "Uttarakhand": ["Dehradun", "Haridwar", "Rishikesh", "Nainital"],
    "Jammu & Kashmir": ["Srinagar", "Jammu", "Anantnag"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select State"),
      ),
      body: ListView.builder(
        itemCount: stateCities.keys.length,
        itemBuilder: (context, index) {
          String state = stateCities.keys.elementAt(index);
          return ListTile(
            title: Text(state),
            onTap: () {
              // Navigate to city selection with cities for the selected state
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelectionScreen(
                    cities: stateCities[state]!,
                  ),
                ),
              ).then((selectedCity) {
                if (selectedCity != null) {
                  Navigator.pop(context, selectedCity); // Return city to HomeScreen
                }
              });
            },
          );
        },
      ),
    );
  }
}
