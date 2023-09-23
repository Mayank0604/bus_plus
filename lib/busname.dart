import 'package:flutter/material.dart';

void main() {
  runApp(BusListApp());
}

class BusListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus List App',
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/busList': (context) => BusListScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/busList');
          },
          child: Text('View Bus List'),
        ),
      ),
    );
  }
}

class BusListScreen extends StatefulWidget {
  @override
  _BusListScreenState createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  List<BusInfo> busList = [
    BusInfo('Bus 1', '9:00 AM', '5:00 PM'),
    BusInfo('Bus 2', '9:30 AM', '5:30 PM'),
    BusInfo('Bus 3', '10:00 AM', '6:00 PM'),
    // Add more bus information here
  ];

  BusInfo? selectedBus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus List'),
      ),
      body: ListView.builder(
        itemCount: busList.length,
        itemBuilder: (context, index) {
          final bus = busList[index];
          return ListTile(
            title: Text(bus.name),
            subtitle: Text('Arrival: ${bus.arrivalTime}, Departure: ${bus.departureTime}'),
            onTap: () {
              setState(() {
                selectedBus = bus;
              });
            },
            selected: selectedBus == bus,
          );
        },
      ),
    );
  }
}

class BusInfo {
  final String name;
  final String arrivalTime;
  final String departureTime;

  BusInfo(this.name, this.arrivalTime, this.departureTime);
}
