import 'package:back/locat.dart';
import 'package:flutter/material.dart';
import 'package:back/login.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  List<String> languages = ['English', 'Hindi', 'Punjabi', 'Bengali', 'Tamil', 'Gujarati'];
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF1E786E)], // Gradient colors
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60), // Larger space between title and rows

            // Custom title "Choose Your Language"
            Text(
              'Choose Your Language',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30), // Space between title and buttons

            // Two buttons in each row with increased space
            for (int i = 0; i < languages.length; i += 2)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildLanguageButton(languages[i]),
                      SizedBox(width: 20), // Space between buttons
                      if (i + 1 < languages.length) buildLanguageButton(languages[i + 1]),
                    ],
                  ),
                  SizedBox(height: 60), // Spacing between rows
                ],
              ),

            SizedBox(height: 60), // Spacing between rows

            // TextButton with text "Let's Get Started" and forward arrow
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpage()),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.black, // Text color
                // backgroundColor: Colors.white, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                // shadowColor: Colors.black, // Shadow color
                // elevation: 5, // Shadow elevation
                padding: EdgeInsets.symmetric(horizontal: 30.0), // Space from left and right
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensure minimal width
                children: [
                  Text(
                    "Let's Get Started   >",
                    style: TextStyle(fontSize: 25), // Increase font size
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageButton(String language) {
    final isSelected = language == selectedLanguage;

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedLanguage = language;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.blue : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          shadowColor: Colors.black, // Shadow color
          elevation: 5, // Shadow elevation
          padding: EdgeInsets.symmetric(horizontal: 30.0), // Space from left and right
        ),
        child: Column(
          children: [
            Text(
              language,
              style: TextStyle(fontSize: 25), // Increase font size
            ),
            if (isSelected) Text('✔'), // Checkmark icon
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LanguageSelectorPage(),
  ));
}