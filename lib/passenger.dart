import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BusStopsPage(),
  ));
}

class BusStopsPage extends StatefulWidget {
  @override
  _BusStopsPageState createState() => _BusStopsPageState();
}

class _BusStopsPageState extends State<BusStopsPage> {
  String selectedFromBusStop = 'Shimla Bus Stop'; // Set an initial value
  String selectedToBusStop = 'Shimla Bus Stop'; // Set an initial value
  List<String> busStops = [
    'Shimla Bus Stop',
    'Manali Bus Stop',
    'Dharamshala Bus Stop',
    'Kullu Bus Stop',
    'Dalhousie Bus Stop',
    // Add more Himachal Pradesh bus stops here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Bus Stops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'From Bus Stop:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedFromBusStop,
              onChanged: (newValue) {
                setState(() {
                  selectedFromBusStop = newValue!;
                });
              },
              items: busStops.map((busStop) {
                return DropdownMenuItem<String>(
                  value: busStop,
                  child: Text(busStop),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            Text(
              'To Bus Stop:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedToBusStop,
              onChanged: (newValue) {
                setState(() {
                  selectedToBusStop = newValue!;
                });
              },
              items: busStops.map((busStop) {
                return DropdownMenuItem<String>(
                  value: busStop,
                  child: Text(busStop),
                );
              }).toList(),
            ),
            SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: () {
                // Handle the "Find Bus" button action here
                if (selectedFromBusStop != 'Shimla Bus Stop' && selectedToBusStop != 'Shimla Bus Stop') {
                  print('Finding bus from $selectedFromBusStop to $selectedToBusStop');
                  // Add your logic to find the bus based on selected bus stops
                } else {
                  // Show an error message if either bus stop is not selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select both "From" and "To" bus stops.'),
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
              },
              child: Text('Find Bus'),
            ),
          ],
        ),
      ),
    );
  }
}
