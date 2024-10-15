import 'package:flutter/material.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/views/product_list_screen.dart'; // Assuming you have this color config

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light background similar to IdealMart
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
                ],
              ),
            ),
          ),

          // Main content with scrolling
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.07, // Adjust based on image height
                ),
                const Text(
                  'iDealMart',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 14, 128,
                        88), // Use the primary color from your app
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.2, // Adjust based on image height
                ),
                const Text(
                  'Shop Smart, Save\nBig on Groceries !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white, // Use white text for visibility on translucent bg
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(children: [
                              Expanded(
                                child: Divider(
                                  color: Color.fromARGB(92, 158, 158, 158),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.0),
                                child: Text("Login",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      // Use white text for visibility on translucent bg
                                    )),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color.fromARGB(92, 158, 158, 158),
                                  thickness: 1,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          // Email TextField
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[
                                  100], // Light background for input fields
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Password TextField
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[100],
                            ),
                          ),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Navigate to Forgot Password screen
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: AppColors.primaryColor, // Accent color
                                ),
                              ),
                            ),
                          ),

                          // Login Button
                          SizedBox(
                            width: double.infinity, // Full width button
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle login logic
                                Future.delayed(const Duration(seconds: 2));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductGridPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: AppColors
                                    .primaryColor, // Use the app's primary color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Sign Up Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigate to Sign Up screen
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color:
                                        AppColors.primaryColor, // Accent color
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
