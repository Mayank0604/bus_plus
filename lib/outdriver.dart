import 'package:flutter/material.dart';

class OutputPage extends StatefulWidget {
  final String name;
  final String idCardNumber;
  final String mobileNumber;
  final String busNumber;
  final String selectedFuel;

  OutputPage({
    required this.name,
    required this.idCardNumber,
    required this.mobileNumber,
    required this.busNumber,
    required this.selectedFuel,
  });

  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Entered'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name: ${widget.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'ID Card Number: ${widget.idCardNumber}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Mobile Number: ${widget.mobileNumber}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Bus Number: ${widget.busNumber}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Bus Emission Compliance (Fuel): ${widget.selectedFuel}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
