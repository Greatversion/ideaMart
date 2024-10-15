import 'package:flutter/material.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/utils/snackBar.dart';
import 'package:idealmart/views/product_list_screen.dart'; // Assuming you have this color config
import 'package:email_validator/email_validator.dart'; // For email validation

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false; // Loading indicator state

  void _togglePasswordView() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      // Simulate a login process
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });

        // Navigate to the next screen after logging in
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductGridPage()),
        );
      });
    }
  }

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
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                const Text(
                  'iDealMart',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 14, 128, 88),
                  ),
                ),
                const Text(
                  'Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // White text for visibility
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
                const Text(
                  'Shop Smart, Save\nBig on Groceries !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for visibility
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Color.fromARGB(92, 158, 158, 158),
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Text("Login",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Color.fromARGB(92, 158, 158, 158),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Email TextField
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
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
                                fillColor: Colors.grey[100],
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),

                            // Password TextField
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _passwordController,
                              obscureText: _obscurePassword,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: _togglePasswordView,
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Navigate to Forgot Password screen
                                  SnackBarHelper.showSnackBar(context,
                                      'Forget password, login with any password you remember.');
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),

                            // Show loading indicator or Login button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _login(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color:
                                            Colors.white) // Loading indicator
                                    : const Text(
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
                                    SnackBarHelper.showSnackBar(context,
                                        "You can sign in with any dummy email.");
                                    // Navigate to Sign Up screen
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
