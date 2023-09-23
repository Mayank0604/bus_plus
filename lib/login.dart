import 'package:flutter/material.dart';
import 'package:back/driver.dart';
import 'package:back/passenger.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key});

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
              CircleAvatar(
              radius: 120, // Adjust the size as needed
              backgroundImage: AssetImage('assets/images/buslogo2.jpg'), // Replace with your circular image asset
            ),
              SizedBox(height: 40),
              Stack(
                alignment: Alignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 50, // Adjust the size as needed
                  //   backgroundImage: AssetImage('assets/images/your_image.png'), // Replace with your circular image asset
                  // ),
                  Column(

                    children: [
                      SizedBox(height: 80), // Add space between the image and the options
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
