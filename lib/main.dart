import 'package:back/lang,dart.dart';
import 'package:flutter/material.dart';
import 'package:back/locat.dart';

void main() {
  runApp(MaterialApp(
    // Application name
    title: 'BusPlus',
    debugShowCheckedModeBanner: false, // Remove debug banner
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text("BusPlus"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(120),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFF1E786E)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/buslogo2.jpg'),
                radius: 130,
              ),
              Spacer(flex: 8),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Text(
                  'Gotta locate bus?\nWe got you....',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Ouutfit',
                    fontWeight:   FontWeight.bold,
                  ),
                ),
              ),
              Spacer(flex: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LanguageSelectorPage()),
                  );
                },
                child: const Text('>'),

              )
            ],
          ),
        ),
      ),
    );
  }
}