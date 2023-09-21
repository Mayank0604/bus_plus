// bus_finder_page.dart

import 'package:flutter/material.dart';

class BusFinderPage extends StatelessWidget {
  List<String> busStops = ['Stop A', 'Stop B', 'Stop C', 'Stop D'];
  String selectedFromStop = 'Stop A';
  String selectedToStop = 'Stop B';

  void findBus(BuildContext context) {
    // Your bus route finding logic here
    // Display the result in a dialog (similar to the previous code)

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Bus Route Found'),
          content: Text('From: $selectedFromStop\nTo: $selectedToStop\nBus Number: XYZ'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedFromStop,
              onChanged: (String? newValue) {
                selectedFromStop = newValue!;
              },
              items: busStops.map((String stop) {
                return DropdownMenuItem<String>(
                  value: stop,
                  child: Text(stop),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedToStop,
              onChanged: (String? newValue) {
                selectedToStop = newValue!;
              },
              items: busStops.map((String stop) {
                return DropdownMenuItem<String>(
                  value: stop,
                  child: Text(stop),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                findBus(context); // Call the findBus function with the context
              },
              child: Text('Find Bus'),
            ),
          ],
        ),
      ),
    );
  }
}
