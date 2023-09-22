import 'package:flutter/material.dart';
  import 'package:back/driver.dart';
  import 'package:back/passenger.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Continue as",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF1E786E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Column(
                children: [
                  InkWell(
                    onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsEntryPage()),
                    );
                      // page (login page for driver)
        },
                    child: Image.asset(
                      'assets/images/bus icon.png', // Replace with your bus image asset
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 30), // Add space below the button
                  Text(
                    "Driver",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Add space between the button and the next pair
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BusStopsPage()),
                      );
                      // page (from and to)
                    },
                    child: Image.asset(
                      'assets/images/user icon.png', // Replace with your user image asset
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 10), // Add space below the button
                  Text(
                    "Passenger",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
