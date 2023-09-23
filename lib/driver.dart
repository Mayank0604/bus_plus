import 'package:flutter/material.dart';
import 'outdriver.dart'; // Import the output page

class DetailsEntryPage extends StatefulWidget {
  @override
  _DetailsEntryPageState createState() => _DetailsEntryPageState();
}

class _DetailsEntryPageState extends State<DetailsEntryPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _busNumberController = TextEditingController();
  String? _selectedFuel;
  List<String> _fuelOptions = ['Diesel', 'Petrol', 'CNG', 'Electric', 'Hybrid', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    _idCardController.dispose();
    _mobileController.dispose();
    _busNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFF1E786E)],
          ),
        ),
        child: Padding(
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
                'Bus Number:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _busNumberController,
                decoration: InputDecoration(hintText: 'Enter bus number'),
              ),
              SizedBox(height: 16.0),

              Text(
                'Bus Emission Compliance:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedFuel,
                items: _fuelOptions.map((fuel) {
                  return DropdownMenuItem<String>(
                    value: fuel,
                    child: Text(fuel),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedFuel = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select fuel type',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),

              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  String idCardNumber = _idCardController.text;
                  String mobileNumber = _mobileController.text;
                  String busNumber = _busNumberController.text;

                  print('Name: $name');
                  print('ID Card Number: $idCardNumber');
                  print('Mobile Number: $mobileNumber');
                  print('Bus Number: $busNumber');
                  print('Bus Emission Compliance (Fuel): $_selectedFuel');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OutputPage(
                        name: name,
                        idCardNumber: idCardNumber,
                        mobileNumber: mobileNumber,
                        busNumber: busNumber,
                        selectedFuel: _selectedFuel ?? 'Not Selected',
                      ),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
