/*
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('डिलीवरी विकल्प'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: 'तारीख़ चुनें:', fontSize: 18, fontWeight: FontWeight.bold),
            // Add your date picker here
            // ...

            SizedBox(height: 20),
            AppText(text: 'समय स्लॉट चुनें:', fontSize: 18, fontWeight: FontWeight.bold),
            // List of time slots (morning, afternoon, evening)
            ListTile(
              title: const Text('सुबह'),
              onTap: () {
                // Handle the selection and pass the data back
              },
            ),
            ListTile(
              title: const Text('दोपहर'),
              onTap: () {
                // Handle the selection and pass the data back
              },
            ),
            ListTile(
              title: const Text('शाम'),
              onTap: () {
                // Handle the selection and pass the data back
              },
            ),
          ],
        ),
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:table_calendar/table_calendar.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  DateTime selectedDate = DateTime.now();
  String selectedTimeSlot = ''; // For storing selected time slot

  // This is for the calendar's current focused day
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('डिलीवरी विकल्प'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: 'तारीख़ चुनें:', fontSize: 18, fontWeight: FontWeight.bold),
            SizedBox(height: 10),
            TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(Duration(days: 30)),
              selectedDayPredicate: (day) {
                // Return true if this day is selected
                return isSameDay(selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay; // Set selected date
                  this.focusedDay = focusedDay; // Update the focused day
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            AppText(text: 'समय स्लॉट चुनें:', fontSize: 18, fontWeight: FontWeight.bold),
            Column(
              children: [
                ListTile(
                  title: const Text('सुबह'),
                  onTap: () {
                    setState(() {
                      selectedTimeSlot = 'सुबह'; // Set morning time slot
                    });
                  },
                  selected: selectedTimeSlot == 'सुबह',
                  tileColor: selectedTimeSlot == 'सुबह' ? Colors.blue.withOpacity(0.2) : null,
                ),
                ListTile(
                  title: const Text('दोपहर'),
                  onTap: () {
                    setState(() {
                      selectedTimeSlot = 'दोपहर'; // Set afternoon time slot
                    });
                  },
                  selected: selectedTimeSlot == 'दोपहर',
                  tileColor: selectedTimeSlot == 'दोपहर' ? Colors.blue.withOpacity(0.2) : null,
                ),
                ListTile(
                  title: const Text('शाम'),
                  onTap: () {
                    setState(() {
                      selectedTimeSlot = 'शाम'; // Set evening time slot
                    });
                  },
                  selected: selectedTimeSlot == 'शाम',
                  tileColor: selectedTimeSlot == 'शाम' ? Colors.blue.withOpacity(0.2) : null,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the selection and pass the data back
                if (selectedTimeSlot.isNotEmpty) {
                  Navigator.pop(context, {
                    'date': selectedDate,
                    'timeSlot': selectedTimeSlot,
                  });
                } else {
                  // Show a message if no time slot is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('कृपया समय स्लॉट चुनें')),
                  );
                }
              },
              child: const Text('सत्यापित करें'),
            ),
          ],
        ),
      ),
    );
  }
}