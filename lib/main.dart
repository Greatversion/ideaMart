import 'package:flutter/material.dart';
import 'package:idealmart/utils/colors.dart';
import 'package:idealmart/views/login_screen.dart';
import 'package:idealmart/views/splash_screen.dart';

void main() {
  runApp(const IdealMart());
}

class IdealMart extends StatelessWidget {
  const IdealMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
