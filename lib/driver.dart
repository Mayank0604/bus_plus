import 'package:flutter/material.dart';

class DetailsEntryPage extends StatefulWidget {
  @override
  _DetailsEntryPageState createState() => _DetailsEntryPageState();
}

class _DetailsEntryPageState extends State<DetailsEntryPage> {
  // Define TextEditingController for each input field
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emissionComplianceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _nameController.dispose();
    _idCardController.dispose();
    _mobileController.dispose();
    _emissionComplianceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
            SizedBox(height: 16.0),

            Text(
              'ID Card Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _idCardController,
              decoration: InputDecoration(hintText: 'Enter your ID card number'),
            ),
            SizedBox(height: 16.0),

            Text(
              'Mobile Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(hintText: 'Enter your mobile number'),
            ),
            SizedBox(height: 16.0),

            Text(
              'Bus Emission Compliance:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emissionComplianceController,
              decoration: InputDecoration(hintText: 'Enter bus emission compliance details'),
            ),
            SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: () {
                // Retrieve entered details from the controllers
                String name = _nameController.text;
                String idCardNumber = _idCardController.text;
                String mobileNumber = _mobileController.text;
                String emissionCompliance = _emissionComplianceController.text;

                // Process or save the details as needed
                // For example, you can print them for now
                print('Name: $name');
                print('ID Card Number: $idCardNumber');
                print('Mobile Number: $mobileNumber');
                print('Bus Emission Compliance: $emissionCompliance');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DetailsEntryPage(),
  ));
}
