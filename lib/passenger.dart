import 'package:flutter/material.dart';
import 'package:back/busname.dart';

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
  String selectedFromBusStop = ''; // Set a default value
  String selectedToBusStop = ''; // Set a default value
  List<String> busStopsHimachalPradesh = [
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF1E786E)], // Customize the gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align children to the top
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16.0), // Add margin at the bottom for spacing
                child: Align(
                  alignment: Alignment.center, // Center the text within the column
                  child: Text(
                    'From Bus Stop:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0, // Increase font size
                    ),
                  ),
                ),
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return busStopsHimachalPradesh.where((busStop) {
                    return busStop.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selected) {
                  setState(() {
                    selectedFromBusStop = selected;
                  });
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  textEditingController.text = selectedFromBusStop;
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView(
                          padding: EdgeInsets.all(16.0),
                          children: options.map((String option) {
                            return ListTile(
                              title: Text(option),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.0),
              Container(
                margin: EdgeInsets.only(bottom: 16.0), // Add margin at the bottom for spacing
                child: Align(
                  alignment: Alignment.center, // Center the text within the column
                  child: Text(
                    'To Bus Stop:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0, // Increase font size
                    ),
                  ),
                ),
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return busStopsHimachalPradesh.where((busStop) {
                    return busStop.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selected) {
                  setState(() {
                    selectedToBusStop = selected;
                  });
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  textEditingController.text = selectedToBusStop;
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView(
                          padding: EdgeInsets.all(16.0),
                          children: options.map((String option) {
                            return ListTile(
                              title: Text(option),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the "Find Bus" button action here
                  if (selectedFromBusStop.isNotEmpty && selectedToBusStop.isNotEmpty) {
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BusListApp()),
                                );
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
      ),
    );
  }
}
