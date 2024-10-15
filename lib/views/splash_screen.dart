import 'dart:async';
import 'package:flutter/material.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer to simulate loading and navigate to Login or Product Grid after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LoginPage(), // Change this to your ProductGridPage if needed
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/splash1.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover, // Ensure the image covers the entire background
          ),

          // Translucent overlay
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(86, 0, 0, 0),
                  Color.fromARGB(100, 0, 0, 0),
                  // Colors.transparent,
                ])),
            // color: const Color.fromARGB(255, 0, 0, 0)
            //     .withOpacity(0.7), // Black with 50% opacity for translucency
          ),

          // Text overlay positioned in the center
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  'iDealMart',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 14, 128,
                        88), // Use the primary color from your app
                  ),
                ),
                Text(
                  'Your groceries, delivered fresh!',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(206, 218, 218,
                        218), // Use white text for visibility on translucent bg
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: CircularProgressIndicator(
                        color: Color.fromARGB(176, 255, 255, 255)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
