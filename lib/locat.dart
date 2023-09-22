// Import the necessary package
import 'package:flutter/material.dart';

class BusFinderPage extends StatefulWidget {
  @override
  _BusFinderPageState createState() => _BusFinderPageState();
}

class _BusFinderPageState extends State<BusFinderPage> {
  TextEditingController fromStopController = TextEditingController();
  TextEditingController toStopController = TextEditingController();

  String selectedFromStop = 'Stop A';
  String selectedToStop = 'Stop B';

  List<String> suggestedStops = ['Stop C', 'Stop D', 'Stop E', 'Stop F']; // Sample suggested stops

  void findBus(BuildContext context) {
    // Get the selected route from the text fields
    selectedFromStop = fromStopController.text;
    selectedToStop = toStopController.text;

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

  void showSuggestions(BuildContext context, TextEditingController controller) {
    // Show a popup menu with suggested stops
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height + 10.0, // Adjust the vertical offset
      ),
      items: suggestedStops.map((String stop) {
        return PopupMenuItem<String>(
          value: stop,
          child: Text(stop),
        );
      }).toList(),
    ).then((String? selectedValue) {
      if (selectedValue != null) {
        // Update the text field with the selected stop
        controller.text = selectedValue;
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    fromStopController.dispose();
    toStopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Finder'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF1E786E)], // Gradient colors
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Text fields for selecting "From" and "To" stops
              TextField(
                controller: fromStopController,
                decoration: InputDecoration(
                  labelText: 'From Stop',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      showSuggestions(context, fromStopController);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: toStopController,
                decoration: InputDecoration(
                  labelText: 'To Stop',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      showSuggestions(context, toStopController);
                    },
                  ),
                ),
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
      ),
    );
  }
}
